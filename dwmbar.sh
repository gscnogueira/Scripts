#!/bin/sh
dte(){
    dte="$(date +"  %a %d %b ^c#ECEFF4^^b#81A1C1^   %H:%M")"
    echo -e  "$dte"
 }
bright(){
        brt="$(xbacklight -get)"
        echo "  $brt%"
}
btry(){

 var="$(acpi| awk '{print $4}'|tr -d ',')"
 case $var in
         100%)
                 icon="";;
         9[0-9]%)
                 icon="";;
         8[0-9]%)
                 icon="";;
         7[0-9]%)
                 icon="" ;;       
         6[0-9]%)
                 icon="" ;;       
         5[0-9]%)
                 icon="" ;;       
         4[0-9]%)
                 icon="" ;;       
         3[0-9]%)
                 icon="" ;;       
         2[0-9]%)
                 icon="" ;;       
         1[0-9]%)
                 icon="" ;;       
         [0-9]%)
                 icon="" ;;
 esac
crg="$(acpi | awk '{print $3}'|tr -d ',')"
if test "$crg" = "Charging"
then
         sta=" (⚡)"
# elif test "$crg" = "Full"
# then
     # /home/gabriel/.local/bin/full_nt
else
     if [[ ${var%\%}  -le 10 ]]
         then 
                 /home/gabriel/.local/bin/bttry_nt
         fi
 fi
 echo "$var $icon$sta"
 
 }
volume(){
    vlm="$(amixer| grep "Front Left.*Playback"| awk '{print $5}'|tr -d "[]")"
    if [[ ${vlm%\%} ==  0 ]]
    then
	    echo "  $vlm"
    else
	    echo "  $vlm"
    fi
}
while true; do
        xsetroot -name "^c#ECEFF4^^b#5E81AC^ $(dte) ^c#ECEFF4^^b#88C0D0^ $(bright) ^c#ECEFF4^^b#8FBCBB^ $(volume) ^c#ECEFF4^^b#A3BE8C^ $(btry) "
    sleep 10s    # Update time every ten seconds
done 

