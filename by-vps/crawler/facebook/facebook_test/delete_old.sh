# Author: Hoanghh
# Last modified: 
# 
# Delete old data
yesterday_path=$(date +%Y/%m/%d -d "-2 days")
today_narrow=$(date +%Y%m%d)
today_path=$(date +%Y/%m/%d)
today_hyphen=$(date +%Y-%m-%d -d "-2 days")

base_src="/data/app/facebook4jcrawler/data/test/big/"
for s in "comment" "postid"
do
	for o in "page" "group"
	do
		exact_dir="${base_src}/${s}/${o}/${yesterday_path}"
		if [ -d "${exact_dir}" ]; then
			rm -rf "${exact_dir}"
		fi
	done
done

# Author: Hoanghh
# Last modified: 
# 
# Delete old data
yesterday_path=$(date +%Y/%m/%d -d "-2 days")

base_src="/data/app/facebook4jcrawler/data/test/old_post_comment"

for o in "page" "group"
do
	exact_dir="${base_src}/${o}/${yesterday_path}"
	if [ -d "${exact_dir}" ]; then
		rm -rf "${exact_dir}"
	fi
done


base_src="/data/app/facebook4jcrawler/logs/test/big/comment"

for o in "page" "group"
do
	exact_dir="${base_src}/${o}"
	rm -f ${exact_dir}/logging.log.${today_hyphen}
done

base_src="/data/app/facebook4jcrawler/logs/test/old_post_comment"

for o in "page" "group"
do
	exact_dir="${base_src}/${o}"
	rm -f ${exact_dir}/logging.log.${today_hyphen}
done