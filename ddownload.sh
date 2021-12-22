#!/usr/bin/env bash
day=0
function daysago(){
  day=$(date -d "$date -$1 days" +"%Y-%m-%d")
}


mkdir -p /tmp/imgs/

i=0
while [ $day != "1989-04-16" ]
do
  daysago $i
  echo $day
  if [ ! -f /tmp/imgs/$day.png ]
  then
    curl -sS --connect-timeout 5 \
    --max-time 10 \
    --retry 5 \
    --retry-delay 0 \
    --retry-max-time 40 \
    https://dilbert.com/strip/$day|grep 'assets.amuniversal.com'|grep 'data-image'|cut -d '"' -f2 |xargs curl -sS -o /tmp/imgs/$day.png

    echo https://dilbert.com/strip/$day
    if [ ! -s /tmp/imgs/$day.png ]; then
	echo "Comic for $day was empty. removing..."
        rm -f /tmp/imgs/$day.png
    fi
  fi

  i=$(($i+1))
done
