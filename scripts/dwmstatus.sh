#!/usr/bin/env bash

volume(){
    volume=34
    echo " $volume%"
}

cpu(){

    cpu_usage=$1
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

    # base do script:
    #https://askubuntu.com/questions/450045/show-cpu-usage-using-a-command
    if ! [ -n "$PREV_TOTAL" ]; then PREV_TOTAL=0; PREV_IDLE=0; fi

# Oque é procstat? Colunas!
# http://www.linuxhowtos.org/System/procstat.htm
linha=$(awk 'NR=1{print $0}' /proc/stat) # linha do somatório
let CPU_USER=$(echo $linha | awk '{print $2}')
let CPU_NICE=$(echo $linha | awk '{print $3}')
let CPU_SYSTEM=$(echo $linha | awk '{print $4}')
let CPU_IDLE=$(echo $linha | awk '{print $5}')
let CPU_IOWAIT=$(echo $linha | awk '{print $6}')
let CPU_IRQ=$(echo $linha | awk '{print $7}')
let CPU_SOFTIRQ=$(echo $linha | awk '{print $8}')

# TOTAL CPU TIME
let TOTAL=$CPU_USER+$CPU_NICE+$CPU_SYSTEM+$CPU_IDLE

# Calculate the CPU usage since we last checked.
let DIFF_IDLE=$CPU_IDLE-$PREV_IDLE
let DIFF_TOTAL=$TOTAL-$PREV_TOTAL
let DIFF_TOTAL_IDLE=$DIFF_TOTAL-$DIFF_IDLE
let CPU_USAGE=(1000*$DIFF_TOTAL_IDLE/$DIFF_TOTAL+5)/10
echo "CPU: $CPU_USAGE%"

# Remember the total and idle CPU times for the next check.
PREV_TOTAL="$TOTAL"
PREV_IDLE="$CPU_IDLE"


xsetroot -name "$(volume) ╎ $(cpu $CPU_USAGE) $(ram) $(hd) ╎ $(online) ╎ $(battery) ╎ $(datetime) 😣"
echo "Atualizado as $(date +%H:%M:%S)"
sleep 5s
done
