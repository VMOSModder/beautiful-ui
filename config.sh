#################
# VMOS TOOL FLASH CONFIG
#################
# Source util functions
. /tool_files/main/exbin/utils
# USE NEW TEMPLATE FOR MODIFICATION ZIP
VERSION=2;ZIPFILE=$1; TMPDIR="$ROOTFS2/${0%/*}"
# $ZIPFILE - PATH to your zip file
# $TMPDIR - PATH to your temporary directory where your files are extracted
[ ! -f "/tool_files/main/exbin/utils" ] && echo "! Please install lastest vmostool" && touch error && exit 1;
[ "$TOOLVERCODE" -lt 12700 ] && echo "! Please install vmostool v1.27+" && touch error && exit 1;
find_bb=`which busybox`
[ ! "$find_bb" ] && echo "! Please install Busybox" && touch error && exit 1;
# Busybox is in /tool_files/main/exbin/busybox
# == REMOVE LIST ==
# Example: I want to delete /system/app/YouTube
REMOVE_LIST="
/system/app/YouTube
"
# List folders and files here if you want to remove, this will overwrite values above!
REMOVE_LIST="

"
# == IGNORE PLACE ==
# Set to true of you don't want place any file into /system
IGNORE_PLACE=false
# == SCRIPT ==
# Enter your post-fs-data script name here
POSTFSDATA=
# Input your late_start script name here
LATESTART=
### You can write your script here!!
# From v1.27, VMOSTool no longer extract all files to TMPDIR
# Use this command to extract your file
# unzip -o $ZIPFILE "your_file" -d "./"

if [ "$API" == "25" ]; then
echo "******************************"
echo "  Flux UI • VMOS Pro"
echo "******************************"
echo "Patch read-only prop: ro.vmos.simplest.rom"
mod_prop ro.vmos.simplest.rom false
else
  IGNORE_PLACE=true
  echo "! Unsupported version ($API)"
  exit 1;
fi