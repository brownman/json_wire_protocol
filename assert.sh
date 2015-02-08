#!/bin/bash


commander() { 
    local args=($@)
    local cmd="${args[@]}"
    echo 1>&2  "[cmd] $cmd"
    eval "$cmd"
}

 dir_root=$( cd $(dirname $0); echo $PWD; )
 cd $(npm -g root)/se-interpreter

file_ok=$dir_root/ok.json
file_err=$dir_root/err.json

( commander node interpreter.js  $file_ok 1>/dev/null  )
echo "============================== $?"
#commander sleep 3

( commander node interpreter.js  $file_err 1>/dev/null  )
echo "============================== $?"
