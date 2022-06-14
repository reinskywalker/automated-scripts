fpath=/sys/class/thermal/thermal_zone0/temp

base_temp=$(cat $fpath)
ctemp=$((base_temp/1000))


echo "Device's current temperature is" : $ctemp C°