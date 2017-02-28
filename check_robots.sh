# !/bin/bash

# this is a sample shell script to periodically check whether 
# a remote robots.txt has been modified to include/exclude Googlebot
# as its User-agent.

wget -q -O robots.txt http://falklandislands.com/robots.txt
if [ -z "`grep -i 'User-Agent:.*Googlebot' robots.txt`" ]
then
  echo -e "`date +'%y%m%d%H%M%S'`\tGooglebot removed"
else
  echo -e "`date +'%y%m%d%H%M%S'`\tGooglebot still remains"
fi


# additional step: to run every 5', add run of this script into crontab
# 1. execute: crontab -e
# 2. add this line in the crontab entry:
#    */5 * * * * ~/check_robots.sh >> ~/check_robots.log
# Now you can view the result of this script via:
#    tail -f ~/check_robots.log