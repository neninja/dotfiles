#!/usr/bin/env bash

volume(){
    volume=34
    echo " $volume%"
}

cpu(){
    #top -bn 1 | awk '{print $9}' | tail -n +8 | awk '{s+=$1} END {print s}'
    #top -bn 1 | awk 'NR>7{s+=$9} END {print s}'
#grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}'
    cpu_usage=83
    cpu_output="CPU "
    # 1 21 41 61 81
    for i in {1..100..20}; do
        if [ $cpu_usage -ge $i ]; then
            cpu_output+="█"
        else
            cpu_output+="▒"
        fi
    done
    echo "$cpu_output"
}

ram(){
    ram_usage=`free | awk '/Mem/ {printf "%.0f", $3/$2*100}'`
    ram_output="RAM "
    # 1 21 41 61 81
    for i in {1..100..20}; do
        if [ $ram_usage -ge $i ]; then
            ram_output+="█"
        else
            ram_output+="▒"
        fi
    done
    echo "$ram_output"
}

hd(){
    free_disk="122"
    echo "$free_disk Gb"
}

online(){
    downl=123.32

    upl=432.32

    echo " $downl  $upl"
}

battery(){
    battery=`acpi -b | grep -P -o '[0-9]+(?=%)'`
    battery_discharging=`acpi -b | grep -P -o 'Discharging'`
    #  
    battery_output="$battery% "

    if [ "$battery_discharging" != 'Discharging' ]; then
        battery_output+=""
    else
        if [ $battery -ge 90 ]; then
            battery_output+=""
        elif [ $battery -ge 80 ]; then
            battery_output+=""
        elif [ $battery -ge 70 ]; then
            battery_output+=""
        elif [ $battery -ge 60 ]; then
            battery_output+=""
        elif [ $battery -ge 50 ]; then
            battery_output+=""
        elif [ $battery -ge 40 ]; then
            battery_output+=""
        elif [ $battery -ge 30 ]; then
            battery_output+=""
        elif [ $battery -ge 20 ]; then
            battery_output+=""
        elif [ $battery -ge 10 ]; then
            battery_output+=""
        else
            battery_output+=""
        fi
    fi

    echo "$battery_output"
}

datetime(){
    echo " $(date +%H:%M)"
}

while true; do
    xsetroot -name "$(volume) ╎ $(cpu) $(ram) $(hd) ╎ $(online) ╎ $(battery) ╎ $(datetime) 😣"
    echo "Atualizado as $(date +%H:%M:%S)"
    sleep 10s
done
