# Author: Hoanghh
# Last modified: 
# 
today_narrow=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)
today_hyphen=$(date +%Y-%m-%d)
host="hoanghh@vn1.in.datasection.com"
local_path="/data/http/facebook-test/${today_path}"
remote_path="/data/share/facebook-test"

scp ${local_path}/* ${host}:${remote_path}/