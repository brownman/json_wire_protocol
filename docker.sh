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

override(){
  test -d $dir_tmp_bin || { mkdir -p $dir_tmp_bin; }
}

ensure_stuff(){
 ensure test -f $file_steps
}

fix_permission(){
# commander chmod u+x *.sh $dir_root/sh -R
  commander chmod u+x *.sh $dir_root/docker -R

}

install(){
   dpkg -s $pkgs || { mute sudo apt-get install -y -q $pkgs; }
   npm list se-interpreter || { mute npm install -g se-interpreter; }
   #install_selenium
   #commander $dir_root/sh/install_selenium.sh
}

run(){
 cat1 $file_steps
 local counter=1
 while read line;do
  test -n "$line" || { exiting 0; }
   broadcast $counter $line
   commander "$line"
   let counter+=1
 done < $file_steps
}

steps(){
set_env
commander override
commander ensure_stuff
commander fix_permission
#commander install
#commander run
commander $dir_root/docker/remote.sh
}


steps
