#!/bin/bash

###################################################################
# written by hoanghh
# created: mar 27, 2015
# last medified: mar 27, 2015
# Goal of script: + Compress facebook data by 'xz', then move to /data/http/...
#                 + Delete old data out of 7 days ago
###################################################################
id="id"
upper_id=$(echo $id | tr '[:lower:]' '[:upper:]')
goal_fomat="+%Y-%m-%d"
package_format="+%Y%m%d"

fixed_goal_date=$(date "$goal_fomat" -d "-4 days")
fixed_package_date=$(date "$package_format" -d "-3 days")
is_fixed=""


# Check if has argument
if [ ! -z "$1" ] && [ ! -z "$2" ] ; then
   goal_date=$(date "$goal_fomat" -d "$1")
   package_date=$(date "$package_format" -d "$2")
   path_date=$()
fi

# Check if valid argument for date
if [ -z "$goal_date" ] || [ -z "$package_date" ]; then
   goal_date="$fixed_goal_date"
   package_date="$fixed_package_date"
   is_fixed="true"
fi

package_year=$(echo $package_date | cut -c 1-4)
package_month=$(echo $package_date | cut -c 5-6)
package_day=$(echo $package_date | cut -c 7-8)
path_date="$package_year/$package_month/$package_day"

des_dir="/data/http/fb/${id}/$path_date"
if [ ! -d "$des_dir" ] ; then
   mkdir -p "$des_dir"
fi

dup_dir="/data/dup/http/fb/${id}/$path_date"
if [ ! -d "$dup_dir" ] ; then
   mkdir -p "$dup_dir"
fi

for section in "PAGE" "GROUP"
do
   src_dir="/data/${upper_id}/$section"
   if [ $section = "PAGE" ]; then
        package_name="fanpage"
   else
         package_name=$(echo $section | tr '[:upper:]' '[:lower:]' )
   fi
   standard_name="$package_date.002000e.${id}-00.sns${id}-$package_name-v1.0.2.UTF-8.+0700.format1.sns.json.tsv"
   dup_standard_name="${standard_name}.dup"

   cd "${src_dir}"
   ## For tsv
   find . -iname "${goal_date}*result.tsv" -exec cat {} >> ${standard_name} \;
   if [ -f "${standard_name}" ] ; then
      xz "${standard_name}"
      mv "${standard_name}.xz" "${des_dir}"
   fi
   
   find . -iname "${goal_date}*result.dup" -exec cat {} >> ${dup_standard_name} \;
   if [ -f "${dup_standard_name}" ] ; then
      xz "${dup_standard_name}"
      mv "${dup_standard_name}.xz" "${dup_dir}"
   fi

   ## delete old data out 7 days
   find . \( -iname "$(date --date '7 days ago' +%Y-%m-%d)*.tsv" -o -iname "$(date --date '7 days ago' +%Y-%m-%d)*.dup" \) -exec xz {} \;
   find . -iname "$(date --date '20 days ago' +%Y-%m-%d)*\.(tsv|dup)" -exec rm -f {} \;
done
