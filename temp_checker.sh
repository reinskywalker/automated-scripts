#!/bin/bash

readonly TEMPERATURE_PATH="/sys/class/thermal/thermal_zone0/temp"

base_temp=$(<$TEMPERATURE_PATH)
ctemp=$((base_temp / 1000))

echo "Device's current temperature is: $ctemp C°"
