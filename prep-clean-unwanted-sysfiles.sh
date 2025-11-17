#!/bin/sh

# prep-clean-unwanted-sysfiles.sh
# ==================================================
# ==================================================
# ==================================================


echo "Starting prep-clean-unwanted-sysfiles.sh ..."

# include


# var
# var=""

# constants
dir_OneDrive_root="/Users/ted/Library/CloudStorage/OneDrive-Personal"
dir_GoogleDrive_root="/Users/ted/Library/CloudStorage/GoogleDrive-tedzhangzg@gmail.com/My Drive"

# clean

# ~/Downloads/AaShare
pushd ~/Downloads/AaShare
# find . -type d -name "__MACOSX" -delete
find . -type f -name "*.DS_Store" -delete
find . -type f -name "Icon*" -delete
find . -type f -name "Thumbs.db" -delete
# find . -type f -name "._*" -delete
# find . -type f -name ".*" -delete
popd

# onedrive
pushd "$dir_OneDrive_root/AaOfl"
# find . -type d -name "__MACOSX" -delete
find . -type f -name "*.DS_Store" -delete
find . -type f -name "Icon*" -delete
find . -type f -name "Thumbs.db" -delete
# find . -type f -name "._*" -delete
# find . -type f -name ".*" -delete
popd

# google drive
pushd "$dir_GoogleDrive_root/AaOfl"
# find . -type d -name "__MACOSX" -delete
find . -type f -name "*.DS_Store" -delete
find . -type f -name "Icon*" -delete
find . -type f -name "Thumbs.db" -delete
# find . -type f -name "._*" -delete
# find . -type f -name ".*" -delete
popd

echo " "

echo "Terminating prep-clean-unwanted-sysfiles.sh ..."


# ==================================================
# Notes
# ==================================================
