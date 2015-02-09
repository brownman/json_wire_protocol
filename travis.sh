#!/bin/bash



export dir_root=$( cd `dirname $0`; echo $PWD; )
ensure(){
  test -v SELENIUM
}

set_env(){
source $dir_root/cfg/config.cfg
source $dir_root/cfg/vars.cfg
}

fix_permission(){
  commander chmod u+x *.sh . -R
}

install(){
   commander sudo apt-get install -y -q curl
   commander npm install -g se-interpreter
}

run(){
 while read line;do
   commander "$line"
 done < $file_steps
}

steps(){
set_env
ensure
fix_permission
install
run
}

steps
