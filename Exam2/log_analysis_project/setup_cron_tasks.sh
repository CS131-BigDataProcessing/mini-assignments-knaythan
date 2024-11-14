#!/bin/bash

# Backup a folder daily at 5 AM
echo "0 5 * * * ./backup/script.sh >> ./cron_logs/backup.log 2>&1" | crontab -

# Send a reminder email every Monday at 6 AM
echo "0 6 * * 1 ./email/script.sh >> ./cron_logs/email.log 2>&1" | crontab -

# Clear log files larger than 10MB in the logs directory every day at midnight
echo "0 0 * * * ./logs -type f -size +10M -exec rm {} \; >> ./cron_logs/filter_file_size.log 2>&1" | crontab -
