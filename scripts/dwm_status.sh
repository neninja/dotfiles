#!/usr/bin/env bash
source ~/.extra

volume(){
    local volume_lvl=$(amixer -D pulse get Master | grep -o -m 1 -E [0-9]+%)
    local volume_status=$(amixer -D pulse get Master | grep -o -m 1 "off")
    if [ "$volume_status" = off ]; then
      echo " $volume_lvl"
    else
      echo " $volume_lvl"
    fi
}

cpu(){
    # CPU line courtesy Procyon:
    # https://bbs.archlinux.org/viewtopic.php?pid=874333#p874333
    #read cpu a b c previdle rest < /proc/stat
    #prevtotal=$((a+b+c+previdle))
    #sleep 0.5
    #read cpu a b c idle rest < /proc/stat
    #total=$((a+b+c+idle))
    #cpu="$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))"
    #printf "%b" "\x05$cpu%\x01"

    local cpu_usage=$1
    local cpu_output=""
    #cpu_output+="CPU "
    # 1 21 41 61 81
    for i in {1..100..10}; do
        if [ $cpu_usage -ge $i ]; then
            cpu_output+="█"
        else
            cpu_output+="▒"
        fi
    done
    echo "$cpu_output"
}

ram(){
    local ram_usage=`free | awk '/Mem/ {printf "%.0f", $3/$2*100}'`
    local ram_output=""
    #ram_output+="RAM "
    # 1 21 41 61 81
    for i in {1..100..10}; do
        if [ $ram_usage -ge $i ]; then
            ram_output+="█"
        else
            ram_output+="▒"
        fi
    done
    echo "$ram_output"
}

hd(){
    # Ver ~/.extra
    local free_disk=$(df -h | grep -P "$THIS_HD_NAME" | awk '{print $4}')
    echo "$free_disk"
}

online(){
    curl -w %{http_code} --silent -o /dev/null google.com | awk '{if($0=="000") {print "OFF"} else { print "ON"}}'
}

battery(){
    # Ver ~/.extra
    local battery_percentage=$(upower -i /org/freedesktop/UPower/devices/$THIS_BATTERY_NAME | grep -P "percentage" | awk '{gsub(/%/,""); print $2}')
    local battery_state=$(upower -i /org/freedesktop/UPower/devices/$THIS_BATTERY_NAME | grep -P "state" | awk '{print $2}')
    local battery_output="$battery_percentage% "

#  
if [ "$battery_state" == 'charging' ]; then
    battery_output+=""
else
    if [ $battery_percentage -ge 90 ]; then
        battery_output+=""
    elif [ $battery_percentage -ge 80 ]; then
        battery_output+=""
    elif [ $battery_percentage -ge 70 ]; then
        battery_output+=""
    elif [ $battery_percentage -ge 60 ]; then
        battery_output+=""
    elif [ $battery_percentage -ge 50 ]; then
        battery_output+=""
    elif [ $battery_percentage -ge 40 ]; then
        battery_output+=""
    elif [ $battery_percentage -ge 30 ]; then
        battery_output+=""
    elif [ $battery_percentage -ge 20 ]; then
        battery_output+=""
    elif [ $battery_percentage -ge 10 ]; then
        battery_output+=""
    else
        battery_output+=""
    fi
fi

echo "$battery_output"
}

datetime(){
  echo "$(date +%a' '%d/%m/%y' '%H:%M)"
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


    xsetroot -name "$(volume) ╎ $(cpu $CPU_USAGE) $(ram) $(hd) ╎ $(online) ╎ $(battery) ╎ $(datetime)"
    echo "Atualizado as $(date +%H:%M:%S)"
    sleep 5s
done
