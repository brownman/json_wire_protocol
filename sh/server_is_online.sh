

while true;do
  ( netstat -ntlp | grep $PORT ) && break || { trace selenium-server still down; } 
  sleep 1
done
