#!/bin/bash  

#- RemoteWebDriver instances should connect to: http://127.0.0.1:4443/wd/hub
#- Started SocketListener on 0.0.0.0:4443
path=session

use_chrome(){
echo POST /session {"desiredCapabilities":{"browserName":"chrome","version":"","javascriptEnabled":true,"platform":"ANY"}}
curl -i --data '{"desiredCapabilities":{"browserName":"chrome","version":"","platform":"ANY","javascriptEnabled":true}}' $HTTP_INTERFACE/$path
#http://localhost:4444/wd/hub/session
}

use_firefox(){
echo POST /session {"desiredCapabilities":{"browserName":"firefox","version":"","javascriptEnabled":true,"platform":"ANY"}}
curl -i --data '{"desiredCapabilities":{"browserName":"firefox","version":"","platform":"ANY","javascriptEnabled":true}}' $HTTP_INTERFACE/$path
#http://localhost:4444/wd/hub/session
}

check_status(){
curl 0.0.0.0:4444/wd/hub/status
}
#use_chrome

check_status
