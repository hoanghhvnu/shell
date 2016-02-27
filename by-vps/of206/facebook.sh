#/bin/bash
# Author: hoanghh
# Date Jan 15, 16
today_path=$(date +%Y/%m/%d)
remote_dir="/data/ArchiveData/vn/facebook/comment/${today_path}/"
local_dir="/data/final/vn/${today_path}"
remote_host="of207"

rsync -az ${remote_host}:${remote_dir} ${local_dir}