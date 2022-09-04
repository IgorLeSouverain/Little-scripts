#! /bin/bash
result=0

while read line; do

    line=${line##*bytes}  # Remove everything up to bytes.
    line=${line%(*}       # Remove everything starting from (.
    
    (( result+=line ))
done < <(ifconfig | grep "RX packets")

echo $result 'bytes'

mb="$(echo "scale=2; "${result}"/1000000" | bc)"       # Converting to MB

echo "$mb" 'MB'

gb="$(echo "scale=2; "${result}"/1000000/1000" | bc)"  # Converting to GB

echo "$gb" 'GB'
