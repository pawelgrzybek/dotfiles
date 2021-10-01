"use strict";
// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: "stable",
    // default font size in pixels for all tabs
    fontSize: 16,
    // font family with optional fallbacks
    fontFamily:
      "Dank Mono, Operator Mono, Menlo, Monaco, 'Courier New', monospace",
    // default font weight: 'normal' or 'bold'
    fontWeight: "normal",
    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: "bold",
    // line height as a relative unit
    lineHeight: 1.625,
    // letter spacing as a relative unit
    letterSpacing: 0,
    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: "#D4D4D4",
    // terminal text color under BLOCK cursor
    cursorAccentColor: "#000",
    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: "BEAM",
    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: false,
    // color of the text
    foregroundColor: "#E1E4E8",
    // terminal background color
    // opacity is only supported on macOS
    backgroundColor: "#24292E",
    // terminal selection color
    selectionColor: "#FFFFFF3D",
    // border color (window, tabs)
    borderColor: "#404040",
    // custom CSS to embed in the main window
    css: `
    .hyper_main {
      border-color: #24292E !important;
    }
    .splitpane_pane > .term_fit:not(.term_active) > div {
      opacity: 0.25;
    }
    .tab_text {
      color: #7F7F7F;
    }
    .tab_text.tab_textActive {
      color: #E1E4E8;
    }
    `,
    // custom CSS to embed in the terminal window
    termCSS: "",
    // set custom startup directory (must be an absolute path)
    workingDirectory: "",
    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: "",
    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: "",
    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: "16px",
    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: "#7F7F7F",
      red: "#F97583",
      green: "#85E89D",
      yellow: "#FFAB70",
      blue: "#79B8FF",
      magenta: "#B392F0",
      cyan: "#9ECBFF",
      white: "#E1E4E8",
      lightBlack: "#7F7F7F",
      lightRed: "#F97583",
      lightGreen: "#85E89D",
      lightYellow: "#FFAB70",
      lightBlue: "#79B8FF",
      lightMagenta: "#B392F0",
      lightCyan: "#9ECBFF",
      lightWhite: "#E1E4E8",
    },
    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Windows Subsystem for Linux (WSL) - previously Bash on Windows
    // - Example: `C:\\Windows\\System32\\wsl.exe`
    //
    // Git-bash on Windows
    // - Example: `C:\\Program Files\\Git\\bin\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    //
    // Cygwin
    // - Example: `C:\\cygwin64\\bin\\bash.exe`
    //
    // Git Bash
    // - Example: `C:\\Program Files\\Git\\git-cmd.exe`
    // Then Add `--command=usr/bin/bash.exe` to shellArgs
    shell: "",
    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ["--login"],
    // for environment variables
    env: {},
    // Supported Options:
    //  1. 'SOUND' -> Enables the bell as a sound
    //  2. false: turns off the bell
    bell: "SOUND",
    // An absolute file path to a sound file on the machine.
    // bellSoundURL: '/path/to/sound/file',
    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: false,
    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,
    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    quickEdit: false,
    // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
    // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
    // (inside tmux or vim with mouse mode enabled for example).
    macOptionSelectionMode: "vertical",
    // Whether to use the WebGL renderer. Set it to false to use canvas-based
    // rendering (slower, but supports transparent backgrounds)
    webGLRenderer: true,
    // if `true` (without backticks and without quotes), Hyper will ignore ligatures provided by some fonts
    disableLigatures: false,
  },
  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [],
  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],
  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};
//# sourceMappingURL=config-default.js.map
