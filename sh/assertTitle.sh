#!/bin/bash

set_env(){
file_ok=$dir_root/json/ok.json
file_err=$dir_root/json/err.json
commander cd $(npm -g root)/se-interpreter
commander echo $PWD
}

ensure_stuff(){
ensure test -f $file_ok
ensure test -f $file_err
ensure ls -l node_modules
}

 

run(){
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
