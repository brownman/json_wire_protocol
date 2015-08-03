#!/usr/bin/env bash
#echo hello world
set -u
file_test=${1:-}
cmd_case=''

if [ "$file_test" = 'test' ];then
cmd_case=default_assert
elif [ -f "$file_test" ];then
echo "[file exist] $file_test"
cmd_case="test1 $file_test"
trace "cmd_case: $cmd_case"
else
trace '[err] invalid arguments'
exit 1;
fi
#if [ "$arguments" != 'test' ];then
#( test -v arguments && { test -f $arguments ; } && { trace "[file exist] $arguments"; } ) || { trace "[NO FILE INPUT] run default tests"; exit 1; }
# file_test=$arguments
#else
#  trace '[default] showing default tests: assertOK+assertERR'
#fi



#set -e
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
dir_npm=$(npm -g root)
commander "test -d $dir_npm"
file_interpreter=$dir_npm/se-interpreter/interpreter.js
browser2=chrome
}

set_env1(){

host=$SELENIUM_PORT_4444_TCP_ADDR
port=$SELENIUM_PORT_4444_TCP_PORT
path='wd/hub'
#cmd_se1="node $file_interpreter   --driver-host=$host --driver-port=$port --driver-path='$path' --browser-browserName=$browser1"

cmd_se2="node $file_interpreter   --driver-host=$host --driver-port=$port --driver-path='$path' --browser-browserName=$browser2"
}

set_env2(){
host=$HOST
port=$PORT
path='/'
}


test1(){
local file="$1"
test -f "$file"
#cmd="node ./interpreter.js --driver-host=$host --driver-port=$port --driver-path='$path' --browser-browserName=chrome $file"
#echo $cmd_se $file
echo "[$browser1] $cmd_se1 $file"
eval "$cmd_se1 $file"
echo "[$browser2] $cmd_se2 $file"
eval "$cmd_se2 $file"

}

default_assert(){
commander "test1 $file_ok"
( eval "test1 $file_err" )  || { trace OK there should be 1 err; }
}

steps(){
#intro
set_env
set_env1
commander "curl $host:$port/$path/status"
commander "$cmd_case"
}
steps
