chrome_driver=$(which chromedriver)
selenium_jar=selenium-server-standalone-2.44.0.jar
java -jar $selenium_jar -timeout=20 -browserTimeout=60x -Dwebdriver.chrome.driver=$chrome_driver
