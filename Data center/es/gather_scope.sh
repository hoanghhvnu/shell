#!/bin/bash
# Author: HoangHH
# Date create: Dec 7, 2015
# auto gather scope id
pattern="user_scope...user___created"
yesterday=$(date +%Y-%m-%d)
src_dir="/data/project/elasticsearch/indexer/_index_stat/${yesterday}"
des_dir="/exdata/facebook_id/scope/${yesterday}"
log_file="/exdata/facebook_id/logging.log"
mkdir -p ${des_dir}

if [ -d ${src_dir} ]; then
	find $src_dir -type f -name "${yesterday}*${pattern}" -exec cat {} >> ${des_dir}/${yesterday}.scope \;
	wc -l ${des_dir}/${yesterday}.scope >> ${log_file}
else
	echo "${yesterday}     Not found any scope"
fi