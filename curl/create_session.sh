#!/bin/bash  

#- RemoteWebDriver instances should connect to: http://127.0.0.1:4443/wd/hub
#- Started SocketListener on 0.0.0.0:4443

netstat -ntlp | grep 4444

echo POST /session {"desiredCapabilities":{"browserName":"firefox","version":"","javascriptEnabled":true,"platform":"ANY"}}

curl -i --data '{"desiredCapabilities":{"browserName":"firefox","version":"","platform":"ANY","javascriptEnabled":true}}' http://localhost:4444/wd/hub/session


