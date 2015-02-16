#!/bin/bash
set -u

file_json="${1:-}"
if [ "$file_json" != 'test' ];then
( test -v file_json && { test -f $file_json ; } && { trace "[file exist] $file"; } ) || { trace "[NO FILE INPUT] run default tests"; exit 1; }
else
  trace '[default] showing default tests: assertOK+assertERR'
fi
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
commander override
commander ensure_stuff
commander fix_permission
#commander install
#commander run
commander bash -c $dir_root/docker/remote.sh $file_json
}


steps
