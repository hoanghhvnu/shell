input_list="list.txt"
input_dir="$1"
output_file="$2"

while read name
do
        total_line=$(find ${input_dir} -type f -name "${name}" -exec cat {} \; | wc -l)
        echo -e "$total_line\t$name" >> ${output_file}
done < $input_list