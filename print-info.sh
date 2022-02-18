echo "Monitor Res     : " $(xdpyinfo  | grep 'dimensions:' | tr -s ' '|cut -c14-21)
echo "Hostname        : " $(hostname)
echo "Home Directory  : " $HOME
echo "Total Mem       : " $(sed -n -e '/^MemTotal/s/^[^0-9]*//p' /proc/meminfo)
echo "HDD Storage     : " $(df | grep '^/dev/[hs]d' | awk '{s+=$2} END {print s/976562.5}') "GB"
