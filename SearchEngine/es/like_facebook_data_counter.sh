data_path_month=$1
output_file=$2

cd $data_path_month
month=06
for i in {01..30}
do
        for section in "fanpage" "group"
        do
                path=$i/2015$month$i.002000.vn-00.likes.snsvn-$section-v1.0.3.UTF-8.+0700.format1.sns.tsv.xz
                total_line=$(xzcat $path | wc -l)
                echo -e "$total_line\t$path" >> $output_file
        done
done
