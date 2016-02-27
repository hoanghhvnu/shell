
#/bin/bash
# written by hoanghh
# Thu Apr 16 09:01:20 ICT 2015
# check if dsjp has access file in /data/http
today_pat=$(date +%d/%b/%Y)
file_pat="vn-00.snsvn"
log_file="/var/log/httpd/access_log"
out_file="/project/hoanghh/jp_access_log.txt"
cat "$log_file" | grep "$today_pat" | grep "$file_pat" # >> "$out_file"