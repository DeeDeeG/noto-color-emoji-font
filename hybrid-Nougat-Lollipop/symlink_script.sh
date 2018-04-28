# Run this script from within the assets/noto-color-emoji-svg
# subdirectory of the hybrid-Nougat-Lollipop folder.
#
# This will symbolically link the approprate SVGs
# from the Nougat and Lollipop directories,
# prioritizing Lollipop SVGs where there is any overlap.


# Info: how to properly create symlinks on Linux:
#
# https://stackoverflow.com/a/1951752
# Answered by hsz, edited by codeforester

# Info: how to prompt the user with a
# "press any key to continue" prompt:
#
# https://unix.stackexchange.com/a/293941
# Answered by MKT, edited by Nick T


Nougat_target_path="../../../Nougat/assets/noto-color-emoji-svg/"

Lollipop_target_path="../../../Lollipop/assets/noto-color-emoji-svg/"



# debug: check whether we are operating on the actual intended target paths
# echo "doing 'ls' at Nougat target path"
# ls $Nougat_target_path

# for debug purposes: pause the output after doing the ls at target path.
# read -n 1 -s -r -p "Press any key to continue"


# debug: check whether we are operating on the actual intended target paths
# echo "doing 'ls' at Lollipop target path"
# ls $Lollipop_target_path

# for debug purposes: pause the output after doing the ls at target path.
# read -n 1 -s -r -p "Press any key to continue"



echo "making symlinks from Nougat"
for current_svg in `ls $Nougat_target_path`
do
  ln -s -f $Nougat_target_path/$current_svg
done

echo "making symlinks from Lollipop (overwrites Nougat where there is overlap)"
for current_svg in `ls $Lollipop_target_path`
do
  ln -s -f $Lollipop_target_path/$current_svg
done
