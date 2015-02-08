#!/bin/bash
trace(){
echo 1>&2  "$@"
}

commander() { 
local args=($@)
local cmd="${args[@]}"
trace  "[cmd] $cmd"
eval "$cmd"
}

set_env(){
dir_root=$( cd $(dirname $0); echo $PWD; )
file_ok=$dir_root/ok.json
file_err=$dir_root/err.json
}

ensure(){
test -f $file_ok
test -f $file_err
}

steps(){
set_env
ensure
pre_run
run
}

pre_run(){
cd $(npm -g root)/se-interpreter
npm ls
npm install -g
npm link
npm ls
}

run(){
( commander node interpreter.js  $file_ok )
echo "============================== $?"
( commander node interpreter.js  $file_err )
echo "============================== $?"
}


