# Author: Hoanghh
# Last modified: 
# 
today_narrow=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)
#yesterday_path=$(date +%Y/%m/%d -d "-0 days")
today_hyphen=$(date +%Y-%m-%d)
base_src="/data/app/crawler/facebook/facebook4jcrawler/data/bypage/comment/fb00"
des_src="/data/http/fb00/${today_path}"

echo "START collect at $(date ''+%Y-%m-%d %H:%M:%S'')"

if [ ! -d "${des_src}" ]; then
        mkdir -p "${des_src}"
fi

now_narrow=$(date +%H%M%S)
for o in "page" "group"
do
        des_file="${des_src}/${today_narrow}.${now_narrow}.vps-fb00.feed-comment.snsvn-${o}-v1.0.3.UTF-8.+0700.format1.sns.json.tsv"
        exact_dir="${base_src}/${o}/${today_hyphen}"
        if [ -d "${exact_dir}" ]; then
                cd ${des_src}
                find ${exact_dir} -type f -name "*comment.json.tsv" -exec cat {} \; >> ${des_file}
                echo "Start xz file: ${des_file} at $(date '+%Y-%m-%d %H:%M:%S')"
                xz ${des_file}
                echo "Finish xz file: ${des_file} at $(date '+%Y-%m-%d %H:%M:%S')"
        fi
done
# for old post comment
base_src="/data/app/crawler/facebook/facebook4jcrawler/data/bypost/comment/fb00"
for o in "page" "group"
do
        des_file="${des_src}/${today_narrow}.${now_narrow}.vps-fb00.postid-comment.snsvn-${o}-v1.0.3.UTF-8.+0700.format1.sns.json.tsv"
        exact_dir="${base_src}/${o}/${today_hyphen}"
        if [ -d "${exact_dir}" ]; then
                cd ${des_src}
                find ${exact_dir} -type f -name "*comment.json.tsv" -exec cat {} \; >> ${des_file}
                echo "Start xz file: ${des_file} at $(date '+%Y-%m-%d %H:%M:%S')"
                xz ${des_file}
                echo "Finish xz file: ${des_file} at $(date '+%Y-%m-%d %H:%M:%S')"
        fi
done
echo "FINISH collect at $(date '+%Y-%m-%d %H:%M:%S')"
