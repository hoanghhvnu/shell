# Author: Hoanghh
# Last modified: 
# 
# Delete old data

today_hyphen=$(date +%Y-%m-%d -d "-5 days")
postid_hyphen=$(date +%Y-%m-%d -d "-5 days")

base_src="/data/app/facebook4jcrawler/data"
find ${base_src}/bypage ${base_src}/bypost -type d -name "${today_hyphen}" -exec rm -rf {} \;
find ${base_src}/postid -type d -name "${postid_hyphen}" -exec rm -rf {} \;