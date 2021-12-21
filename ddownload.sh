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
    curl -sS https://dilbert.com/strip/$day|grep 'assets.amuniversal.com'|grep 'og:image'|cut -f 4 -d '"'|xargs curl -sS -o /tmp/imgs/$day.png
  fi

  i=$(($i+1))
done
