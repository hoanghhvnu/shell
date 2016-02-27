# Author: Hoanghh
# Last modified: 
# 
today_narrow=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)
today_hyphen=$(date +%Y-%m-%d)

des_path="/data/http/fb/vn/comment/${today_path}"
src_path="/data/share/facebook-test"
cp ${src_path}/* ${des_path}/
# delete
rm -f ${src_path}/*