#!/bin/bash
# author: hoanghh
# date: Sep 10, 15
# Email report about data daily

today_path=$(date +%Y/%m/%d)
today_hyphen=$(date +%Y-%m-%d)
http_dir="/data/final/vn/${today_path}"
report_path="/data/app/data_report/report/${today_hyphen}"

mkdir -p ${report_path}
total_news="0"
if [ -d $http_dir ]; then
        cd $http_dir
                for f in $(ls -1)
                do
                        total_line=$(xzcat $f | wc -l)
                        pretty_line=$(/usr/bin/printf "%'10d" ${total_line})
                        echo -e "${pretty_line}\t$f" >> ${report_path}/${today_hyphen}_data_report.txt
                done
fi
