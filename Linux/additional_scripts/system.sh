#!/bin/bash

#free memory
free -h > ~/backups/freemem/free_mem.txt

#disk usage
du -h > ~/backups/diskuse/disk_usage.txt

#lists open files
lsof > ~/backups/openlist/open_list.txt

#free disk space
df -h > ~/backups/freedisk/free_disk.txt
