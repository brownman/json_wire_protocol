#!/bin/bash

commander() { 
    local args=($@)
    local cmd="${args[@]}"
    echo 1>&2  "[cmd] $cmd"
    eval "$cmd"
}

 dir_root=$( cd $(dirname $0); echo $PWD; )
 cd $(npm -g root)/se-interpreter
 npm ls
 npm install -g
 npm link
 npm ls

file_ok=$dir_root/ok.json
file_err=$dir_root/err.json


test -f $file_ok
test -f $file_err


( commander node interpreter.js  $file_ok )
echo "============================== $?"
#commander sleep 3

( commander node interpreter.js  $file_err )
echo "============================== $?"
