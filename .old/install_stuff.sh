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
install_chrome_driver(){
#npm install chromedriver
#Or grab the source and
node ./install.js
ensure which chromedriver
}

install_chrome(){
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update -qq
sudo apt-get install -qq google-chrome-stable
}
install_chrome_driver2(){
commander wget $url_chrome_driver 
commander unzip chromedriver*.zip
commander rm chromedriver*.zip
ensure ls -l chrom*
commander   mv chromedriver /tmp/bin
ensure test -f /tmp/bin/chromedriver
}
