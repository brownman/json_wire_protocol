#!/bin/bash


commander() { 
    local args=($@)
    local cmd="${args[@]}"
    echo 1>&2  "[cmd] $cmd"
    eval "$cmd"
}



( commander node interpreter.js printTitleOk.json 1>/dev/null  )
echo "============================== $?"
#commander sleep 3

( commander node interpreter.js printTitleErr.json 1>/dev/null  )
echo "============================== $?"
