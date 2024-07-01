#!/bin/bash

if [[ -z "$1" || "$1" == *"-h"* ]]; then
    echo "Usage: ./nmap.sh <ip>" 1>&2
    exit 1
fi

target=$1
run_time=$(date +"%H-%M")
folder_name="nmap-$target"
file_1="basictcp-$run_time"
file_2="tcpscripts-$run_time"

mkdir $folder_name
exec 3>&1  # Open FD 3 as a duplicate of stdout (fd 1)

basic_tcp_scan_command="nmap $target -oA $folder_name/$file_1"
printf "$basic_tcp_scan_command\n\n"
output=$($basic_tcp_scan_command | tee /dev/fd/3)

if [[ ${output} != *"Host seems down."* ]];then
    ports=$(echo "$output" | grep "open" | awk -F "/" '{ print $1 }' | tr '\n' ','| sed 's/.\{1\}$//')
    tcp_script_scan_command="nmap $target -p $ports -sC -sV -oA $folder_name/$file_2"
    printf "\n$tcp_script_scan_command\n\n"
    output=$($tcp_script_scan_command | tee /dev/fd/3)
fi

exec 3>&-  # Close FD 3