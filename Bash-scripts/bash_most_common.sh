#! /bin/bash

Counter() {
    declare -A dict

    while read line; do
        c=${dict[x$line]}
        dict[x$line]=$((c+1))
    done < /home/$USER/.bash_history

    for k in "${!dict[@]}" ; do
        echo "${dict[$k]}"$'\t'"${k#x}"
    done

}

Counter | sort -n
