#!/bin/bash

commander npm install -g selenium-webdriver


push `dirname $0` >/dev/null
commander node ./test.js
popd > /dev/null
