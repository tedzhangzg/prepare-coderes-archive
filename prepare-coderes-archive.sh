#!/bin/sh

# prepare-coderes-archive.sh
# ==================================================
# ==================================================
# ==================================================


echo "Starting prepare-coderes-archive.sh ..."

# include


# var
# var=""

# constants
# 
dir_OneDrive_root="/Users/ted/Library/CloudStorage/OneDrive-Personal"
dir_GoogleDrive_root="/Users/ted/Library/CloudStorage/GoogleDrive-tedzhangzg@gmail.com/My Drive"
# 
tmpdir="$HOME/Downloads/temppreparchive"
# 
dir_src_localgitrepo_root="$HOME/code"
dir_src_OneDrive_folder_root="$dir_OneDrive_root/AaOfl/SharedByMe/ITPublicFolder/code-res"
# 
dir_final_zip_OneDrive="$dir_OneDrive_root/AaOfl/SharedByMe/ITPublicFolder"
dir_final_zip_GoogleDrive="$dir_GoogleDrive_root/AaOfl/SharedByMe/ITPublicFolder"

# clean
# 
pushd "$dir_OneDrive_root/AaOfl"
# find . -type d -name "__MACOSX" -delete
find . -type f -name "*.DS_Store" -delete
find . -type f -name "Icon*" -delete
find . -type f -name "Thumbs.db" -delete
# find . -type f -name "._*" -delete
# find . -type f -name ".*" -delete
popd
# 
pushd "$dir_GoogleDrive_root/AaOfl"
# find . -type d -name "__MACOSX" -delete
find . -type f -name "*.DS_Store" -delete
find . -type f -name "Icon*" -delete
find . -type f -name "Thumbs.db" -delete
# find . -type f -name "._*" -delete
# find . -type f -name ".*" -delete
popd


# list
echo "List of archives"
echo "1 - software-install-macos"
echo "2 - software-install-linux"
echo "3 - software-install-windows"
echo "4 - hardware-testkit-macos"
echo "5 - hardware-testkit-linux"
echo "6 - hardware-testkit-windows"

# ask
while [[ ! $input_osplatform =~ ^[0-9]+$ ]] || [[ "$input_osplatform" -lt "1" ]] || [[ "$input_osplatform" -gt "6" ]]
do
    read -p "Enter number - archive to do > " input_osplatform
done

# start process

# get name_src_local_folder from input_osplatform
case $input_osplatform in
    1)
        # 1
        name_src_local_folder="software-install-macos"
        ;;
    2)
        # 2
        name_src_local_folder="software-install-linux"
        ;;
    3)
        # 3
        name_src_local_folder="software-install-windows"
        ;;
    4)
        # 4
        name_src_local_folder="hardware-testkit-macos"
        ;;
    5)
        # 5
        name_src_local_folder="hardware-testkit-linux"
        ;;
    6)
        # 6
        name_src_local_folder="hardware-testkit-windows"
        ;;
    *)
        # default
        name_src_local_folder="Unknown"
        ;;
esac

# prep before copy
mkdir $tmpdir
mkdir "$tmpdir/$name_src_local_folder"

# copy
if [[ $((input_osplatform % 3)) -eq "0" ]]
then
    cp -R "$dir_src_localgitrepo_root/$name_src_local_folder"/run* "$tmpdir/$name_src_local_folder"
fi
cp -R "$dir_src_localgitrepo_root/$name_src_local_folder"/a_readme.txt "$tmpdir/$name_src_local_folder"
cp -R "$dir_src_localgitrepo_root/$name_src_local_folder"/script-init* "$tmpdir/$name_src_local_folder"
cp -R "$dir_src_OneDrive_folder_root/$name_src_local_folder"/* "$tmpdir/$name_src_local_folder"

# zip
pushd $tmpdir
zip -r -X -qq "$HOME/Downloads/$name_src_local_folder"".zip" "$name_src_local_folder"
# zip -r -X -qq test.zip test -x '**/.*'
# tar --disable-copyfile -czf "$HOME/Downloads/$name_src_local_folder"".tar.gz" "$name_src_local_folder"
popd

# cp
mv "$HOME/Downloads/$name_src_local_folder"".zip" "$dir_final_zip_OneDrive"
cp "$dir_final_zip_OneDrive/$name_src_local_folder"".zip" "$dir_final_zip_GoogleDrive"

# rm
rm -rf "$tmpdir"

echo " "

echo "Terminating prepare-coderes-archive.sh ..."


# ==================================================
# Notes
# ==================================================
