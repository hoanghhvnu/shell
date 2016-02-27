# Author: Hoanghh
# Last modified: 
# 
today_narrow=$(date +%Y%m%d -d "-1 day")
today_path=$(date +%Y/%m/%d -d "-1 day")
today_hyphen=$(date +%Y-%m-%d -d "-1 day")

base_src="/data/app/news/newforumcrawler/data/${today_narrow}"
cd ${base_src}

report_path="/data/app/data_report/report/${today_hyphen}"

mkdir -p ${report_path}
for name in $(ls -1)
do
	count=$(find $name -type f -exec cat {} \; | wc -l)
	pretty_line=$(/usr/bin/printf "%'10d" ${count})
	echo -e "${pretty_line}\t${name}" >> ${report_path}/${today_hyphen}_data_report.txt
done