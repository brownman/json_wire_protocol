

gitlab_ci_runner@046ccd32806b:~/.nvm/v0.10.33/lib/node_modules/se-interpreter$ cat config.cfg 
host=$SELENIUM_SERVER_PORT_4444_TCP_ADDR
port=$SELENIUM_SERVER_PORT_4444_TCP_PORT
path='/wd/hub'
file1='examples/tests/assertTitle.json'

cmd="node ./interpreter.js --driver-host=$host --driver-port=$port --driver-path='$path' --browser-browserName=chrome $file1""
echo $cmd
$cmd
