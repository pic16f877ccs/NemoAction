#!/bin/bash
#
#
# Rename a KiCad project
#
# Copyright pic16f877ccs 2020
#
# Licensed under GPLv3
#
# version 0.1
#
#
scriptdir=`dirname "$0"` ;
echo "$scriptdir"
#
# Get your language
lang="${MDM_LANG%_*}" ;
#
#
# Imort the translation suiting your language. 
# If there's no translation for your language, import the english one.
langdir="$scriptdir/lang" ;
if [ -f "$langdir/$lang.ini" ] 
   then source "$langdir/$lang.ini" ;
   else source "$langdir/en.ini" ;
fi ;
#
#
#if ! pdftk_error=$(pdftk "ddatei1.pdf" cat 1-endeast output "error.pdf" 2>&1) ; then 
#
#echo "$pdftk_error" ;
#    zenity --error --text="$pdftk_error" --title="$title_error_pdftk" --height="$height_error_pdftk" --width="$width_error_pdftk" 2>/dev/null ;
#
#fi ;
#
#
#new_basename=`echo "$basename" | sed "s/$space/$replace/g"` ;
#new_basename=`echo "$@" | sed "s/\ /\_/g"`
#
#
tag=""
#
#
file_path="$@" ; 
dir_name=`dirname "$file_path"` ;
base_name=`basename "$file_path"` ;
base_name_cut=`basename -s .pro "$file_path"` ;
echo "Ordner hat den Namen: $dir_name" ;
echo "Datei hat den Namen: $base_name" ;
echo "Datei hat den Namen: $base_name_cut" ;
#
#
base_name_rename=$(zenity --entry --title="$title" --text="$text" --entry-text="$base_name_cut" --height="$height") ;
#
#
#cp -i "$dir_name/${base_name_cut}.pro" "$dir_name/${base_name_cut}${tag}.pro"
cp -i "$dir_name/${base_name_cut}.pro" "$dir_name/${base_name_rename}.pro"
cp -i "$dir_name/${base_name_cut}.sch" "$dir_name/${base_name_rename}.sch"
cp -i "$dir_name/${base_name_cut}.kicad_pcb" "$dir_name/${base_name_rename}.kicad_pcb"
cp -i "$dir_name/${base_name_cut}.net" "$dir_name/${base_name_rename}.net"
cp -i "$dir_name/${base_name_cut}-cache.lib" "$dir_name/${base_name_rename}-cache.lib"
#
#
Terminal=true ;
sleep 10 
