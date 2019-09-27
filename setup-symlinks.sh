# Variables
dir=~/.dotfiles
files=".zshrc .gitconfig .hyper.js"

# Lets make it look nicer
echo ""
echo "- - - - - - - - - -"
echo ""

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# Lets make it look nicer
echo ""
echo "- - - - - - - - - -"
echo ""

# Create symlinks
for file in $(echo $files); do
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/$file
  echo "- - -"
done

# Lets make it look nicer
echo ""
echo "- - - - - - - - - -"
echo ""
echo "All done. Have a great day :-*"
echo " "
echo "- - - - - - - - - -"
echo ""

# initialize new settings
source ~/.zshrc
