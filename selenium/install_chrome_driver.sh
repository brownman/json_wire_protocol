#!/bin/bash

#location
mkdir -p $dir_selenium
cd $dir_selenium

#download + extract
wget $CHROMEDRIVER_LINUX_URL 
unzip chromedriver*.zip
rm chromedriver*.zip

#ensure file exist
ls -l chrom*
