# Author: HoangHH
# Last modified: Feb 4, 2016
# Send email about data crawl
goal_day=$(date +%Y-%m-%d -d "-1 day")
file_name="${report_path}/report.txt"
while true
do
	if [ -f ${file_name} ]; then
		cat ${report_path}/report.txt | mail -s "[Report] Data report for $goal_day" -r monitoring@datasection.com.vn -c thaonp@datasection.com.vn,congnt@datasection.co.jp,dangnt@datasection.com.vn hoanghh@datasection.com.vn
		break
	fi
	echo "Date report: not found ${file_name}, wait 60s..."
	sleep 60
done