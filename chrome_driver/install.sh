CHROMEDRIVER_LINUX_URL='http://chromedriver.storage.googleapis.com/2.10/chromedriver_linux32.zip'
SELENIUM=$HOME/SELENIUM

mkdir SELENIUM
cd $SELENIUM

wget $CHROMEDRIVER_LINUX_URL 
unzip chromedriver*.zip
rm chromedriver*.zip
ls -l chrom*
