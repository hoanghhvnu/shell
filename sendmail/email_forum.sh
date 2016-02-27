#!/bin/bash
# author: hoanghh
# date: Sep 10, 15
goal_day=$(date +%Y-%m-%d -d "-1 day")
today_path=$(date +%Y/%m/%d)
http_dir="/data/http/forum/${today_path}"
total_news="0"
if [ -d $http_dir ]; then
	cd $http_dir
	total_news=$(xzcat * | wc -l)
fi
echo -e "This is result craw data for ${goal_day}\nTotal Forum: ${total_news}" | mail -s "[Report] Forum crawler for $goal_day" -r report.facebook@datasection.com.vn hoanghh.vnu@gmail.com congnt@datasection.co.jp
