#!/bin/bash  

#- RemoteWebDriver instances should connect to: http://127.0.0.1:4443/wd/hub
#- Started SocketListener on 0.0.0.0:4443
browser=chrome

while true;do
  ( netstat -ntlp | grep 4444 ) && break || { echo selenium-server still down; } 
  sleep 1
done

echo POST /session {"desiredCapabilities":{"browserName":"$browser","version":"","javascriptEnabled":true,"platform":"ANY"}}

curl -i --data \'{"desiredCapabilities":{"browserName":"$browser","version":"","platform":"ANY","javascriptEnabled":true}}\' http://localhost:4444/wd/hub/session


