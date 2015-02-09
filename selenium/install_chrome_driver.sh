CHROMEDRIVER_LINUX_URL='http://chromedriver.storage.googleapis.com/2.10/chromedriver_linux32.zip'
SELENIUM=$HOME/SELENIUM

#location
mkdir -p $SELENIUM
cd $SELENIUM

#download + extract
wget $CHROMEDRIVER_LINUX_URL 
unzip chromedriver*.zip
rm chromedriver*.zip

#ensure file exist
ls -l chrom*
