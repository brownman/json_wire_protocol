
export CHROME_REVISION="290620"
export CHROMEDRIVER_VERSION="2.10"
export CHROME_DEVEL_SANDBOX='$dir_tmp_bin/chrome-linux/chrome_sandbox'

cd $dir_tmp_bin

#if [[ "$WD_SPEC_DRIVER" = "chrome" ]]; then
#fi
#sh -e /etc/init.d/xvfb start
commander sudo chmod 1777 /dev/shm

commander sudo apt-get install -y unzip libxss1

commander curl --fail -L -O "http://commondatastorage.googleapis.com/chromium-browser-snapshots/Linux_x64/${CHROME_REVISION}/chrome-linux.zip"
commander unzip chrome-linux.zip

# chrome sandbox doesn't currently work on travis: https://github.com/travis-ci/travis-ci/issues/938
commander sudo chown root:root chrome-linux/chrome_sandbox
commander sudo chmod 4755 chrome-linux/chrome_sandbox
