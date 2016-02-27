# fetch global id
remote_user="dzung"
today_path=$(date +%Y/%m/%d)
today_hyphen=$(date +%Y-%m-%d)
base_path="/home/dzung"
local_path="/exdata/facebook_id/global/${today_path}"
mkdir -p ${local_path}
for i in {00..01}
do
        scp ${remote_user}@fbid${i}.datasection.com.vn:${base_path}/${today_path}/${today_hyphen}.global.${i} ${local_path}
done