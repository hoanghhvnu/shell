# Author: Hoanghh
# Last modified: 
# 
today_narrow=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)
today_hyphen=$(date +%Y-%m-%d)
cm_page_path="/data/CRAWLER_DATA/rt-facebook/comment/fanpage"
cm_group_path="/data/CRAWLER_DATA/rt-facebook/comment/group"

remote_cm_page_path="/data/app/facebook/crawlerfacebookrest/data/comment/page"
remote_cm_group_path="/data/app/facebook/crawlerfacebookrest/data/comment/group"

scp hoanghh@rt-facebook.datasection.com.vn:${remote_cm_page_path}/${today_hyphen}*.tsv ${cm_page_path}/
scp hoanghh@rt-facebook.datasection.com.vn:${remote_cm_group_path}/${today_hyphen}*.tsv ${cm_group_path}/
