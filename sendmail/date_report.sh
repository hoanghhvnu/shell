#!/bin/bash
# author: hoanghh
# date: Sep 10, 15
# Email report about data daily
goal_day=$(date +%Y-%m-%d -d "-1 day")
today_path=$(date +%Y/%m/%d)
http_dir="/data/final/vn/${today_path}"
report_path="/data/app/data_report/data/${today_path}"
#remote_path="/project/hoanghh/report/${today_path}"
mkdir -p ${report_path}
total_news="0"
if [ -d $http_dir ]; then
    cd $http_dir
    find . -type f -exec sh -c "echo {};xzcat {} | wc -l" \; >> ${report_path}/report.txt
    #ssh vn1 "mkdir -p ${remote_path}"
    #scp ${report_path}/report.txt vn1:${remote_path}
fi
#cat ${report_path}/report.txt | mail -s "[Report] Datareport for $goal_day" -r report.data@datasection.com.vn hoanghh.vnu@gmail.com congnt@datasection.co.jp
