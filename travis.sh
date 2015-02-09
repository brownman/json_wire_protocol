#!/bin/bash
set -u

export dir_root=$( cd `dirname $0`; echo $PWD; )

set_env(){
echo 1>&2 $FUNCNAME
source $dir_root/cfg/helper.cfg
source $dir_root/cfg/vars.cfg
}


ensure_stuff(){
 ensure test -f $file_steps
}

fix_permission(){
 commander chmod u+x *.sh . -R
}

install(){
   commander sudo apt-get install -y -q curl
   commander npm install -g se-interpreter
   #install_selenium
   commander $dir_root/sh/install_selenium.sh
}

run(){
 cat1 $file_steps
 
 while read line;do
   commander "$line"
 done < $file_steps
}

steps(){
set_env
commander ensure_stuff
commander fix_permission
commander install
commander run
}

steps
