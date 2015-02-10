#/bin/bash

#ref:
#https://github.com/jarib/selenium-travis/blob/master/install.sh
commander curl -L -O "http://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"
commander unzip chromedriver_linux64.zip

commander mv chromedriver chrome-linux/chromedriver
commander chmod +x chrome-linux/chromedriver

