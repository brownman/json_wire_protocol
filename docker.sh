#!/usr/bin/env bash
set -u
file_test=${1:-}
echo file_test $file_test
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
  commander sudo chmod u+x *.sh $dir_root/docker

}

steps(){
set_env
local file=$file_test

#commander override
#commander ensure_stuff
#commander fix_permission
#commander install
#commander run
commander bash -c "'$dir_root/docker/remote.sh $file'"
#$file_test"
}


steps
