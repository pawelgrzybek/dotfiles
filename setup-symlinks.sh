# based on
# http://www.placona.co.uk/1224/linux/managing-your-dotfiles-the-right-way/

# Variables
dir=~/.dotfiles
dirold=~/.dotfiles_backup
files=".bash_profile .hushlogin .eslintrc .scss-lint.yml"

# create dotfiles_backup in homedir
echo "Creating $dirold for backup of any existing dotfiles in ~"
mkdir -p $dirold

# Lets make it look nicer
echo " "
echo "* * * * * * * * * * * *"
echo " "

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# Lets make it look nicer
echo " "
echo "* * * * * * * * * * * *"
echo " "

# move any existing dotfiles in homedir to dotfiles_backup directory
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $dirold"
    mv ~/$file $dirold
done

# Lets make it look nicer
echo " "
echo "* * * * * * * * * * * *"
echo " "

# Create symlinks
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

# Lets make it look nicer
echo " "
echo "* * * * * * * * * * * *"
echo " "
echo "All done :-)"
echo " "

# initialize new settings
source ~/.bash_profile
