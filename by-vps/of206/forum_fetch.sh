# Author: hoanghh
# date Feb 2, 2015
# collect data from vps multi mirror vps to main forum
yesterday_narrow=$(date +%Y%m%d -d "-1 days");
#yesterday_narrow=$(date +%Y%m%d);
data_path="/data/app/forum/newforumcrawler/data/${yesterday_narrow}"
for i in {01..03} {05..07}
do
        mkdir -p ${data_path}/vps_forum$i
        scp -r forum$i.datasection.com.vn:${data_path} ${data_path}/vps_forum$i
done