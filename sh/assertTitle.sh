#!/bin/bash

set_env(){
host='0.0.0.0'
port=9515
path='/'
file_ok=$dir_root/json/ok.json
file_err=$dir_root/json/err.json
browser=chrome
cmd_se="node ./interpreter.js   --driver-host=$host --driver-port=$port --driver-path='$path' --browser-browserName=$browser"
}

ensure_stuff(){
ensure test -f $file_ok
ensure test -f $file_err
}

pre_run(){
  chromedriver &
  sleep 5
}

run(){
#GOTO
commander cd $(npm -g root)/se-interpreter
#ensure ls -l node_modules
#commander echo $PWD
#RUN
commander $cmd_se  $file_ok 
echo "============================== $?"
commander $cmd_se  $file_err 
echo "============================== $?"
}


steps(){
commander set_env
commander ensure_stuff
commander pre_run
commander run
}


steps
