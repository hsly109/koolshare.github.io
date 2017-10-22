#!/bin/sh
LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")

URL="https://www.google.com.tw"
result=`curl -4 -o /dev/null -I -s -m 2 --connect-timeout 2 -w %{http_code} $URL`
status=`echo $result`

if [ "$status" == "200" ]; then
  log='[ '$LOGTIME' ] working...'
else
  log='[ '$LOGTIME' ] Problem detected!'
fi

nvram set ss_foreign_state="$log"
#dbus ram ss_basic_state_foreign="$log"