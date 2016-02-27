# Author: Hoanghh
# Last modified: 
# 
today_narrow=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)
#yesterday_path=$(date +%Y/%m/%d -d "-0 days")
today_hyphen=$(date +%Y-%m-%d)
base_src="/data/app/facebook4jcrawler/data/bypage/comment/dev"
des_src="/data/http/facebook-test/${today_path}"

if [ ! -d "${des_src}" ]; then
        mkdir -p "${des_src}"
fi

for o in "page" "group"
do
        des_file="${des_src}/${today_narrow}.000000.vps-fbt.feed-comment.snsvn-${o}-v1.0.3.UTF-8.+0700.format1.sns.json.tsv"
        exact_dir="${base_src}/${o}/${today_hyphen}"
        if [ -d "${exact_dir}" ]; then
                cd ${des_src}
                find ${exact_dir} -type f -name "*comment.json.tsv" -exec cat {} \; >> ${des_file}
                xz ${des_file}
        fi
done
# for old post comment
base_src="/data/app/facebook4jcrawler/data/bypost/comment/dev"
for o in "page" "group"
do
        des_file="${des_src}/${today_narrow}.000000.vps-fbt.postid-comment.snsvn-${o}-v1.0.3.UTF-8.+0700.format1.sns.json.tsv"
        exact_dir="${base_src}/${o}/${today_hyphen}"
        if [ -d "${exact_dir}" ]; then
                cd ${des_src}
                find ${exact_dir} -type f -name "*comment.json.tsv" -exec cat {} \; >> ${des_file}
                xz ${des_file}
        fi
done
