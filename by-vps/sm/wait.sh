# Author: Hoanghh
# Last modified: 
# 
today_narrow=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)
today_hyphen=$(date +%Y-%m-%d)

#src_dir="/home/hoanghh/test"
src_dir="/data/http/${today_path}"
while true
do

        if [ -d ${src_dir} ];then
                count=$(find ${src_dir} -type f -name "*.xz" | wc -l)
                count_tsv=$(find ${src_dir} -type f -name "*.tsv" | wc -l)
                if [ ${count} -eq 0 -a ${count_tsv} -gt 0 ]; then
                        break;
                fi
        fi
        echo "not found file in ${src_dir}, sleep 60s..."
        sleep 60
done
