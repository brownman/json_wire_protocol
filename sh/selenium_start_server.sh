


selenium_start1(){
commander cd $dir_selenium
ensure test -f $chrome_driver
ensure test -f $selenium_jar
ensure which chromedriver

( commander "sudo java -jar $selenium_jar -timeout=20 -browserTimeout=60x -Dwebdriver.chrome.driver=$(which chromedriver)" || { trace kill process; kill 0; }  &)&


trace Selenium is alive !
}

selenium_start(){
 ensure which chromedriver
 commander  chromedriver &
}

selenium_start1
