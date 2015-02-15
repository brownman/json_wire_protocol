#!/bin/bash

set -u
set -e
#command npm &>/dev/null || { trace 'npm not found'; exit 0; }
commander npm -v
commander test -v dir_root
commander test -d "$dir_root"

intro(){
commander 'env | grep 4444'
}
set_env(){
file_ok=$dir_root/json/ok.json
file_err=$dir_root/json/err.json
file_interpreter=$(npm -g root)/se-interpreter/interpreter.js
browser=chrome


}

set_env1(){

host=$SELENIUM_PORT_4444_TCP_ADDR
port=$SELENIUM_PORT_4444_TCP_PORT
path='wd/hub'
cmd_se="node $file_interpreter   --driver-host=$host --driver-port=$port --driver-path='$path' --browser-browserName=$browser"
}

set_env2(){
host=$HOST
port=$PORT
path='/'
}


test1(){
local file=$1
test -f $file
#cmd="node ./interpreter.js --driver-host=$host --driver-port=$port --driver-path='$path' --browser-browserName=chrome $file"
#echo $cmd_se $file
echo "[CMD] $cmd_se $file"

eval "$cmd_se $file"
}


steps(){
intro
set_env
set_env1
commander "curl $host:$port/$path/status"
commander "test1 $file_ok"
( eval "test1 $file_err" )  || { trace OK there should be 1 err; }
}
steps
