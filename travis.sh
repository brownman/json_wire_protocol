#!/bin/bash
set -u

export dir_root=$( cd `dirname $0`; echo $PWD; )
######temp:


########33
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
   commander sudo apt-get install -y -q $pkgs
   commander npm install -g se-interpreter
   #install_selenium
   commander $dir_root/sh/install_selenium.sh
}

run(){
 cat1 $file_steps
 local counter=1
 while read line;do
   broadcast "[$counter] $line"
   commander "$line"
   let counter+=1
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
