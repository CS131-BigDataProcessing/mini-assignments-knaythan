# Cron Task Automation

## About

This project includes two files:

1. **about_crontask.txt**  
   Answers two questions:
   - What types of tasks can be automated using `cron` or `at`?
   - What risks come with poorly managed automated tasks, and how to avoid them?

2. **crontab.txt**  
   Contains example cron jobs to automate common tasks:
   - **Daily File Cleanup**: Deletes all files in a temp folder at 2:00 AM.
   - **Weekly Backup**: Creates a backup of the home directory every Sunday at 3:00 AM.
   - **Disk Usage Report**: Emails a daily disk usage report at 8:30 AM.

## How to Use

1. **Set up the cron jobs**:
   Open the crontab editor:
   ```bash
   crontab -e
