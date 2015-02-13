
set_env0(){
host=$HOST
port=$PORT
path='/'
}

set_env1(){
host=$SELENIUM_SERVER_PORT_4444_TCP_ADDR
port=$SELENIUM_SERVER_PORT_4444_TCP_PORT
path='/wd/hub'
}

set_env(){
file_ok=$dir_root/json/ok.json
file_err=$dir_root/json/err.json
browser=chrome
cmd_se="node ./interpreter.js   --driver-host=$host --driver-port=$port --driver-path='$path' --browser-browserName=$browser"
}

test1(){
local file=$1
test -f $file
cmd="node ./interpreter.js --driver-host=$host --driver-port=$port --driver-path='$path' --browser-browserName=chrome $file"
echo $cmd
$cmd
}

test1 $file_ok
test1 $file_err