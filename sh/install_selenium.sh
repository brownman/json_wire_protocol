install_selenium_2(){
  # Install the Selenium Server
  wget http://selenium.googlecode.com/files/selenium-server-standalone-2.26.0.jar -O selenium-server.jar;
  # Firefox is already installed
  
  # Install Google Chrome
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
  sudo apt-get install libgconf2-4
  sudo dpkg -i google-chrome*.deb
  sudo apt-get -f install  # reported dependency issue?
  
  # Install the Google Chrome webdriver
  mkdir /tmp/bin
  wget https://chromedriver.googlecode.com/files/chromedriver_linux32_23.0.1240.0.zip
  unzip chromedriver_linux32_23.0.1240.0.zip
  mv chromedriver /tmp/bin
}

install_selenium(){
    #update selenium + chrome-driver
   commander mkdir -p $dir_selenium
   commander cd $dir_selenium
   
   commander wget $url_selenium_server
   ensure test -f $selenium_jar
   commander wget $url_chrome_driver 
   commander unzip chromedriver*.zip
   commander rm chromedriver*.zip
   ensure ls -l chrom*
}

install_selenium
