mkdir /etc/cron.d
cd /etc/cron.d
wget https://git.archive.org/services/persistent-logging/-/raw/main/log_shipper.sh

cd /
# between 1 and 3 am
randomminute=$(($RANDOM % 60))
randomhour=$((1 + $RANDOM % 2))
echo -e "$randomminute $randomhour * * * sh /etc/cron.d/log_shipper.sh $1 >> /var/log/cron.log 2>&1\n" >> /etc/crontabs/root
crontab /etc/crontabs/root