# fish completion for hugo                                 -*- shell-script -*-

function __hugo_debug
    set -l file "$BASH_COMP_DEBUG_FILE"
    if test -n "$file"
        echo "$argv" >> $file
    end
end

function __hugo_perform_completion
    __hugo_debug "Starting __hugo_perform_completion"

    # Extract all args except the last one
    set -l args (commandline -opc)
    # Extract the last arg and escape it in case it is a space
    set -l lastArg (string escape -- (commandline -ct))

    __hugo_debug "args: $args"
    __hugo_debug "last arg: $lastArg"

    # Disable ActiveHelp which is not supported for fish shell
    set -l requestComp "HUGO_ACTIVE_HELP=0 $args[1] __complete $args[2..-1] $lastArg"

    __hugo_debug "Calling $requestComp"
    set -l results (eval $requestComp 2> /dev/null)

    # Some programs may output extra empty lines after the directive.
    # Let's ignore them or else it will break completion.
    # Ref: https://github.com/spf13/cobra/issues/1279
    for line in $results[-1..1]
        if test (string trim -- $line) = ""
            # Found an empty line, remove it
            set results $results[1..-2]
        else
            # Found non-empty line, we have our proper output
            break
        end
    end

    set -l comps $results[1..-2]
    set -l directiveLine $results[-1]

    # For Fish, when completing a flag with an = (e.g., <program> -n=<TAB>)
    # completions must be prefixed with the flag
    set -l flagPrefix (string match -r -- '-.*=' "$lastArg")

    __hugo_debug "Comps: $comps"
    __hugo_debug "DirectiveLine: $directiveLine"
    __hugo_debug "flagPrefix: $flagPrefix"

    for comp in $comps
        printf "%s%s\n" "$flagPrefix" "$comp"
    end

    printf "%s\n" "$directiveLine"
end

# this function limits calls to __hugo_perform_completion, by caching the result behind $__hugo_perform_completion_once_result
function __hugo_perform_completion_once
    __hugo_debug "Starting __hugo_perform_completion_once"

    if test -n "$__hugo_perform_completion_once_result"
        __hugo_debug "Seems like a valid result already exists, skipping __hugo_perform_completion"
        return 0
    end

    set --global __hugo_perform_completion_once_result (__hugo_perform_completion)
    if test -z "$__hugo_perform_completion_once_result"
        __hugo_debug "No completions, probably due to a failure"
        return 1
    end

    __hugo_debug "Performed completions and set __hugo_perform_completion_once_result"
    return 0
end

# this function is used to clear the $__hugo_perform_completion_once_result variable after completions are run
function __hugo_clear_perform_completion_once_result
    __hugo_debug ""
    __hugo_debug "========= clearing previously set __hugo_perform_completion_once_result variable =========="
    set --erase __hugo_perform_completion_once_result
    __hugo_debug "Successfully erased the variable __hugo_perform_completion_once_result"
end

function __hugo_requires_order_preservation
    __hugo_debug ""
    __hugo_debug "========= checking if order preservation is required =========="

    __hugo_perform_completion_once
    if test -z "$__hugo_perform_completion_once_result"
        __hugo_debug "Error determining if order preservation is required"
        return 1
    end

    set -l directive (string sub --start 2 $__hugo_perform_completion_once_result[-1])
    __hugo_debug "Directive is: $directive"

    set -l shellCompDirectiveKeepOrder 32
    set -l keeporder (math (math --scale 0 $directive / $shellCompDirectiveKeepOrder) % 2)
    __hugo_debug "Keeporder is: $keeporder"

    if test $keeporder -ne 0
        __hugo_debug "This does require order preservation"
        return 0
    end

    __hugo_debug "This doesn't require order preservation"
    return 1
end


# This function does two things:
# - Obtain the completions and store them in the global __hugo_comp_results
# - Return false if file completion should be performed
function __hugo_prepare_completions
    __hugo_debug ""
    __hugo_debug "========= starting completion logic =========="

    # Start fresh
    set --erase __hugo_comp_results

    __hugo_perform_completion_once
    __hugo_debug "Completion results: $__hugo_perform_completion_once_result"

    if test -z "$__hugo_perform_completion_once_result"
        __hugo_debug "No completion, probably due to a failure"
        # Might as well do file completion, in case it helps
        return 1
    end

    set -l directive (string sub --start 2 $__hugo_perform_completion_once_result[-1])
    set --global __hugo_comp_results $__hugo_perform_completion_once_result[1..-2]

    __hugo_debug "Completions are: $__hugo_comp_results"
    __hugo_debug "Directive is: $directive"

    set -l shellCompDirectiveError 1
    set -l shellCompDirectiveNoSpace 2
    set -l shellCompDirectiveNoFileComp 4
    set -l shellCompDirectiveFilterFileExt 8
    set -l shellCompDirectiveFilterDirs 16

    if test -z "$directive"
        set directive 0
    end

    set -l compErr (math (math --scale 0 $directive / $shellCompDirectiveError) % 2)
    if test $compErr -eq 1
        __hugo_debug "Received error directive: aborting."
        # Might as well do file completion, in case it helps
        return 1
    end

    set -l filefilter (math (math --scale 0 $directive / $shellCompDirectiveFilterFileExt) % 2)
    set -l dirfilter (math (math --scale 0 $directive / $shellCompDirectiveFilterDirs) % 2)
    if test $filefilter -eq 1; or test $dirfilter -eq 1
        __hugo_debug "File extension filtering or directory filtering not supported"
        # Do full file completion instead
        return 1
    end

    set -l nospace (math (math --scale 0 $directive / $shellCompDirectiveNoSpace) % 2)
    set -l nofiles (math (math --scale 0 $directive / $shellCompDirectiveNoFileComp) % 2)

    __hugo_debug "nospace: $nospace, nofiles: $nofiles"

    # If we want to prevent a space, or if file completion is NOT disabled,
    # we need to count the number of valid completions.
    # To do so, we will filter on prefix as the completions we have received
    # may not already be filtered so as to allow fish to match on different
    # criteria than the prefix.
    if test $nospace -ne 0; or test $nofiles -eq 0
        set -l prefix (commandline -t | string escape --style=regex)
        __hugo_debug "prefix: $prefix"

        set -l completions (string match -r -- "^$prefix.*" $__hugo_comp_results)
        set --global __hugo_comp_results $completions
        __hugo_debug "Filtered completions are: $__hugo_comp_results"

        # Important not to quote the variable for count to work
        set -l numComps (count $__hugo_comp_results)
        __hugo_debug "numComps: $numComps"

        if test $numComps -eq 1; and test $nospace -ne 0
            # We must first split on \t to get rid of the descriptions to be
            # able to check what the actual completion will be.
            # We don't need descriptions anyway since there is only a single
            # real completion which the shell will expand immediately.
            set -l split (string split --max 1 \t $__hugo_comp_results[1])

            # Fish won't add a space if the completion ends with any
            # of the following characters: @=/:.,
            set -l lastChar (string sub -s -1 -- $split)
            if not string match -r -q "[@=/:.,]" -- "$lastChar"
                # In other cases, to support the "nospace" directive we trick the shell
                # by outputting an extra, longer completion.
                __hugo_debug "Adding second completion to perform nospace directive"
                set --global __hugo_comp_results $split[1] $split[1].
                __hugo_debug "Completions are now: $__hugo_comp_results"
            end
        end

        if test $numComps -eq 0; and test $nofiles -eq 0
            # To be consistent with bash and zsh, we only trigger file
            # completion when there are no other completions
            __hugo_debug "Requesting file completion"
            return 1
        end
    end

    return 0
end

# Since Fish completions are only loaded once the user triggers them, we trigger them ourselves
# so we can properly delete any completions provided by another script.
# Only do this if the program can be found, or else fish may print some errors; besides,
# the existing completions will only be loaded if the program can be found.
if type -q "hugo"
    # The space after the program name is essential to trigger completion for the program
    # and not completion of the program name itself.
    # Also, we use '> /dev/null 2>&1' since '&>' is not supported in older versions of fish.
    complete --do-complete "hugo " > /dev/null 2>&1
end

# Remove any pre-existing completions for the program since we will be handling all of them.
complete -c hugo -e

# this will get called after the two calls below and clear the $__hugo_perform_completion_once_result global
complete -c hugo -n '__hugo_clear_perform_completion_once_result'
# The call to __hugo_prepare_completions will setup __hugo_comp_results
# which provides the program's completion choices.
# If this doesn't require order preservation, we don't use the -k flag
complete -c hugo -n 'not __hugo_requires_order_preservation && __hugo_prepare_completions' -f -a '$__hugo_comp_results'
# otherwise we use the -k flag
complete -k -c hugo -n '__hugo_requires_order_preservation && __hugo_prepare_completions' -f -a '$__hugo_comp_results'
