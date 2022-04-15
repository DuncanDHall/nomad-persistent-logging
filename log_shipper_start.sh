
cd /
# between 1 and 3 am
# randomminute=$(($RANDOM % 60))  TODO $RANDOM is not available at this point...
# randomhour=$((1 + $RANDOM % 2))
# echo -e "$randomminute $randomhour * * * sh /etc/cron.d/log_shipper.sh $1 >> /var/log/cron.log 2>&1\n" >> /etc/crontabs/root
echo -e "* * * * * sh /local/log_shipper.sh $1 >> /var/log/cron.log 2>&1\n" >> /local/logger_crontab
crontab /local/logger_crontab

sleep 3600
echo "hi, I'm here, you need ot sleep"
