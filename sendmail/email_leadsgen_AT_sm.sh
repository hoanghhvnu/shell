#!/bin/bash
today_name=$(date +%Y-%m-%d)



subject="DSV - Leadsgen monitoring for ${today_name} (difference sender)"
content="Data for dsv"
from_addr="monitoring@datasection.com.vn"
to_addr="hoanghh@datasection.com.vn"
cc_addr="congnt@datasection.co.jp,dangnt@datasection.com.vn,thaonp@datasection.com.vn,nguyetlang37@gmail.com"
bcc_addr="hoanghhdsvn@gmail.com"
dir_path="/data/app/leadsgen/xz"
file_name="${today_name}.zip"



while true
do
	if [ -f ${dir_path}/${file_name} ]; then
		python gmail.py "${subject}" "${content}" "${from_addr}" "${to_addr}" "${cc_addr}" "${bcc_addr}" "${dir_path}" "${file_name}"
		break
	fi
	echo "Not found ${dir_path}/${file_name}, wait 60s..."
	sleep 60
done