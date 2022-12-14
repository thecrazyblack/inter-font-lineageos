#!/sbin/sh
#
# ADDOND_VERSION=2
#
# /system/addon.d/70-inter.sh
# During a LineageOS upgrade, this script backs up inter-fonts,
# /system is formatted and reinstalled, then the files are restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
etc/fonts.xml
fonts/AndroidClock.ttf
fonts/CutiveMono.ttf
fonts/DroidSansMono.ttf
fonts/NotoSerif-Bold.ttf
fonts/NotoSerif-BoldItalic.ttf
fonts/NotoSerif-Italic.ttf
fonts/NotoSerif-Regular.ttf
fonts/Roboto-Regular.ttf
fonts/RobotoFallback-VF.ttf
fonts/RobotoStatic-Regular.ttf
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
