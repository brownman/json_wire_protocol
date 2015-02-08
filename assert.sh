#!/bin/bash


alias commander=eval

( commander node interpreter.js printTitleOk.json 1>/dev/null  )
echo "============================== $?"
#commander sleep 3

( commander node interpreter.js printTitleErr.json 1>/dev/null  )
echo "============================== $?"
