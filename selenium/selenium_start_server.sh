ensure test -f $chrome_driver
ensure test -f $selenium_jar
commander java -jar $selenium_jar -timeout=20 -browserTimeout=60x -Dwebdriver.chrome.driver=$chrome_driver
