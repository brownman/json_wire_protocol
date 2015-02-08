#!/bin/bash
trace(){
echo 1>&2  "$@"
}

commander() { 
local args=($@)
local cmd="${args[@]}"
trace  "[cmd] $cmd"
eval "$cmd" || { trace exiting 1; exit 1; }
}

set_env(){
dir_root=$( cd $(dirname $0); echo $PWD; )
file_ok=$dir_root/ok.json
file_err=$dir_root/err.json
commander cd $(npm -g root)/se-interpreter
}

ensure(){
test -f $file_ok
test -f $file_err
commander echo $PWD
}

 

run(){

commander node interpreter.js  $file_ok 
echo "============================== $?"
commander node interpreter.js  $file_err 
echo "============================== $?"
}


steps(){
set_env
ensure
run
}


steps
