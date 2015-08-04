
install_selenium(){
    #update selenium + chrome-driver
   commander mkdir -p $dir_selenium
   commander cd $dir_selenium
   
   commander wget $url_selenium_server
   ensure ls -l
   ensure test -f $selenium_jar
}



commander install_selenium
