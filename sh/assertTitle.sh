#!/bin/bash

set_env(){
host=$HOST
port_standalone=4444
port_chromedriver=9515


path_chromedriver='/'
path_standalone='/wd/hub'


file_ok=$dir_root/json/ok.json
file_err=$dir_root/json/err.json
browser=chrome
cmd_se="node ./interpreter.js   --driver-host=$host --driver-port=$port_standalone --driver-path='$path_standalone' --browser-browserName=$browser"
}

ensure_stuff(){
ensure test -f $file_ok
ensure test -f $file_err
}



run(){
#GOTO
commander cd $(npm -g root)/se-interpreter
#ensure ls -l node_modules
#commander echo $PWD
#RUN
cat1 $file_ok
#trace  $cmd_se  $file_ok
commander $cmd_se  $file_ok 

echo "============================== $?"
#cat1 $file_err
trace $cmd_se  $file_err 
eval "$cmd_se  $file_err"
echo "============================== $?"
}


steps(){
commander set_env
commander ensure_stuff
commander run
}


steps
