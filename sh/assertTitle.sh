#!/bin/bash

set_env(){
file_ok=$dir_root/json/ok.json
file_err=$dir_root/json/err.json
}

ensure_stuff(){
ensure test -f $file_ok
ensure test -f $file_err
}

run(){
#GOTO
commander cd $(npm -g root)/se-interpreter
ensure ls -l node_modules
commander echo $PWD

#RUN
commander node interpreter.js  $file_ok 
echo "============================== $?"
commander node interpreter.js  $file_err 
echo "============================== $?"
}


steps(){
commander set_env
commander ensure_stuff
commander run
}


steps
