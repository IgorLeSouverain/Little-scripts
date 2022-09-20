#! /usr/bin/bash

curl -vI "$1" | awk 'NR%2==9'
