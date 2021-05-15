#Loop will keep pinging every five seconds till the ping succeds
#Can be used with termux-tts-speak
#Type following in terminal:
## $ . internet.sh | termux-tts-speak
#This script will say "IPv4 is up" whenever ping succeds/ internet is back up.
#Below mentioned command could have also been used but since internet is not working curl will not work.
## $ . bash <(curl -fsSL https://raw.githubusercontent.com/prateeksingla/termux-scripts/main/internet.sh)
# Author:   Prateek Singla
#!/bin/bash
while true
do
  if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
    echo "IPv4 is up"
    break
  else
    sleep 5 # Delay of 5 seconds set, this can be customized here.
  fi
done
exit 0
