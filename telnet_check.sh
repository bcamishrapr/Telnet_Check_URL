#!/bin/bash
#host=google.com
#port=80
#read -p "Please Enter host and port: " host port

 > /tmp/status.txt

 > /tmp/status_not.txt

IFS=$'\n'

for input in `cat /tmp/Host_Port.txt`

do

 > /tmp/a.txt

# ${host} ${port}

( echo open ${input}

sleep 2
        echo quit ) | timeout 60 telnet >> /tmp/a.txt

ST=$(cat /tmp/a.txt | grep -o "Escape character is")

if [ "$ST" = "Escape character is" ]

  then
          echo "telnet is ok : ${input} " >> /tmp/status.txt

  else
          echo "telnet isn't ok ${input}" >> /tmp/status_not.txt
  fi

done
