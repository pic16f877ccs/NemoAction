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
#new_basename=`echo "$basename" | sed "s/$space/$replace/g"` ;
#new_basename=`echo "$@" | sed "s/\ /\_/g"`
#
#
file_path="$@" ; 
dir_name=`dirname "$file_path"` ;
base_name=`basename "$file_path"` ;
base_name_cut=`basename -s .pro "$file_path"` ;
#
#
base_name_rename=$(zenity --entry --title="$title" --text="$text" --entry-text="$base_name_cut" --height="$height" --width="$width" 2>/dev/null) ;
#
#
# Erstelle ein Verzeichnis, wenn es noch nicht existiert
if [ ! -e "$dir_name/$base_name_rename" ] 
	then mkdir "$dir_name/../$base_name_rename" ;
fi ;
#  
# Test rename and copy files.
cp -i "$dir_name/${base_name_cut}.pro" "$dir_name/../$base_name_rename/${base_name_rename}.pro" ;
#
if [ -f "$dir_name/${base_name_cut}.sch" ] 
    then cp -i "$dir_name/${base_name_cut}.sch" "$dir_name/../$base_name_rename/${base_name_rename}.sch" ;   
fi ;
#
if [ -f "$dir_name/${base_name_cut}.kicad_pcb" ] 
    then cp -i "$dir_name/${base_name_cut}.kicad_pcb" "$dir_name/../$base_name_rename/${base_name_rename}.kicad_pcb" ;   
fi ;
#
if [ -f "$dir_name/${base_name_cut}.net" ] 
    then cp -i "$dir_name/${base_name_cut}.net" "$dir_name/../$base_name_rename/${base_name_rename}.net" ;   
fi ;
#
if [ -f "$dir_name/${base_name_cut}-cache.lib" ] 
    then cp -i "$dir_name/${base_name_cut}-cache.lib" "$dir_name/../$base_name_rename/${base_name_rename}-cache.lib" ;   
fi ;
#
if [ -f "$dir_name/${base_name_cut}.kicad_wks" ] 
    then cp -i "$dir_name/${base_name_cut}.kicad_wks" "$dir_name/../$base_name_rename/${base_name_rename}.kicad_wks" ;   
fi ;
#
if [ -f "$dir_name/${base_name_cut}.kicad_mod" ] 
    then cp -i "$dir_name/${base_name_cut}.kicad_mod" "$dir_name/../$base_name_rename/${base_name_rename}.kicad_mod" ;   
fi ;
#
if [ -f "$dir_name/fp-info-cache" ] 
    then cp -i "$dir_name/fp-info-cache" "$dir_name/../$base_name_rename/fp-info-cache" ;   
fi ;
#  
#
#Terminal=true ;
#sleep 10 
