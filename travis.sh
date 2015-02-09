#!/bin/bash



export dir_root=$( cd `dirname $0`; echo $PWD; )

set_env(){
source $dir_root/cfg/config.cfg
source $dir_root/cfg/vars.cfg
}

run(){
commander echo hello world
commander blllllaaaaa_errrrr
}

steps(){
set_env
run
}

steps
