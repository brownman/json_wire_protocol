#!/bin/bash



export dir_root=$( cd `dirname $0`; echo $PWD; )

set_env(){
source $dir_root/cfg/config.cfg
source $dir_root/cfg/vars.cfg
}

imported(){

  sudo apt-get install -y -q curl
   npm install -g se-interpreter

  wget http://selenium.googlecode.com/files/selenium-server-standalone-2.25.0.jar
  java -jar selenium-server-standalone-2.25.0.jar > /dev/null 2>&1 &

 chmod u+x ./curl/create_session.sh
 bash -c ./curl/create_session.sh

 chmod u+x ./assert.sh
 bash -c ./assert.sh
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
