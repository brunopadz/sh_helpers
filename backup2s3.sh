#!/bin/bash
DATE=`date "+%d-%m-%Y"`

aws s3 sync /backup_dir/ s3://bucket_name/folder/
if [ "$?" = 0 ]; then
  find /backup/ -mindepth 1 -mtime +1 -delete
else
  echo "$DATE - Error while trying to sync files to S3" >> /var/log/backup_log
fi
