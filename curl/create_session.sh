echo POST /session {"desiredCapabilities":{"browserName":"firefox","version":"","javascriptEnabled":true,"platform":"ANY"}}

curl -i --data '{"desiredCapabilities":{"browserName":"firefox","version":"","platform":"ANY","javascriptEnabled":true}}' http://localhost:4444/wd/hub/session


