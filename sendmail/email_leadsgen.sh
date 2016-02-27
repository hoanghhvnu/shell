# email
today_hyphen=$(date +%Y-%m-%d)
cd ~/leadsgen/
file_name="${today_hyphen}.zip"
while true
do
	if [ -f ${file_name} ]; then
		echo "This attachment for Leadsgen" | mail -s "DSV - Leadsgen Monitor for ${today_hyphen}" -a ${file_name} -c hoanghh@datasection.com.vn,thaonp@datasection.com.vn,dangnt@datasection.com.vn,nguyetlang37@gmail.com congnt@datasection.co.jp
		break
	fi
	echo "Leadsgen: not found ${file_name}, wait 60s..."
	sleep 60
done