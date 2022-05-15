#!/bin/bash

path="$1"

pair=$(perl -n -e'/\[pair (\S+)\]/ && print $1' < $path)
echo "discovering ..."
vdirsyncer -c "$path" discover "$pair"

echo "syncing ..."
vdirsyncer -c "$path" sync