#!/bin/bash


pushd `dirname $0` >/dev/null

commander npm install -g selenium-webdriver
commander npm link selenium-webdriver

commander node ./test.js
popd > /dev/null
