remote_user="hoanghh"
vps_order="00"
today_path=$(date +%Y/%m/%d -d "-0 days")
today_hyphen=$(date +%Y-%m-%d -d "-0 days")


remote_dir="/home/${remote_user}/data/${today_hyphen}"
file_name="${today_hyphen}.scope.${vps_order}"
output_name="${today_hyphen}.global.${vps_order}"

cd /home/${remote_user}
java -jar FacebookIdConvert-1.0.1.jar 42 ${file_name} ${output_name}