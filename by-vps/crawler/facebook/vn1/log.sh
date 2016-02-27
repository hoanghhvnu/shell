# log
facebook() {
	input_path=$1
	output_dir=$2
	file_name=$(echo ${input_path} | awk -F '/' '{print $NF}')
	mkdir -p ${output_dir}
	output=${output_dir}/${file_name}.stat
	cat ${input_path} | grep "CrawlerFanpage:470" | awk -F ' ' '{print $11,$13}' >> ${output}
}
facebook $1 $2