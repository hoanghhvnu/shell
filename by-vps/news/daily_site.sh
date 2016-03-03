
# Author: Hoanghh
# Last modified: 
# 
today_narrow=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)
today_hyphen=$(date +%Y-%m-%d)


base_out="/data/app/site_report/${today_hyphen}.tsv"
user="hoanghh"

mkdir data
for i in "news" "forum"
do
	scp ${user}@${i}.datasection.com.vn:${base_out} data/${today_hyphen}.${i}.tsv
done