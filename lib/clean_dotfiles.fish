echo "Delete all symblic links from the given modules: '$dots'"
echo "Do you want to continue? (y/n)"
read con
test "$con" = "y" || exit 1

for dot in $dots 

  # -v verbose
  # -R recursive
  # -t target
  stow -v -R -d $DOT_FILES_DIR/dots -t $HOME -D $dot

end

