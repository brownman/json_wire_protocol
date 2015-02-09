

commander cd $dir_selenium
ensure test -f $chrome_driver
ensure test -f $selenium_jar
ensure which chromedriver
commander "java -jar $selenium_jar -timeout=20 -browserTimeout=60x -Dwebdriver.chrome.driver=chromedriver &"



while true;do
  ( netstat -ntlp | grep 4444 ) && break || { trace selenium-server still down; } 
  sleep 1
done

trace Selenium is alive !
