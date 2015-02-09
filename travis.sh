#!/bin/bash



export dir_root=$( cd `dirname $0`; echo $PWD; )

cat1(){
local file=$1
test -f $file && { trace $file;trace '-----';cat 1>&2 -n  $file; trace; } || true
}

set_env(){
source $dir_root/cfg/helper.cfg
source $dir_root/cfg/vars.cfg
}

ensure(){
 ensure test -v SELENIUM
 ensure test -f $file_steps
}

fix_permission(){
 commander chmod u+x *.sh . -R
}

install(){
   commander sudo apt-get install -y -q curl
   commander npm install -g se-interpreter
   
   #update selenium + chrome-driver
   commander mkdir -p $dir_selenium
   commander cd $dir_selenium
   
   commander wget $url_selenium_server
   commander test -f $selenium_jar
   commander wget $url_chrome_driver 
   commander unzip chromedriver*.zip
   commander rm chromedriver*.zip
   ensure ls -l chrom*
}

run(){
 cat1 $file_step 
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
