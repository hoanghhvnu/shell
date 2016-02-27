#!/bin/bash
# Author: HoangHH
# Date: Feb 22, 2016
# Check run with condition of CongNT
file=/data/temp_$(date +%Y-%m-%d).txt
if [ ! -f ${file} ]
then
    # Rerun
    # code here
    pkill -f java
    /data/app/CommentNewsCrawler/run.sh
else
    minimumsize=10
    actualsize=$(du -k "$file" | cut -f 1)
    if [ $actualsize -ge $minimumsize ]; then
        #echo size is over $minimumsize kilobytes
        # it is ok
        echo "$(date +%Y-%m-%d_%H-%M-%S) ok" >> log_check_run.log
    else
        #echo size is under $minimumsize kilobytes
        # delete then return
        rm -f ${file}
        #  rerun
        # Code here
        pkill -f java
        /data/app/CommentNewsCrawler/run.sh
    fi
fi
