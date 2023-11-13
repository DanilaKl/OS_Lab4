#!/bin/bash


FILES=$(find ./labfiles/ -name "TEST-[0-9]")
GR_YEARS=$(grep -oh "[0-9][0-9][0-9][0-9]" $FILES | sort -u)


for file in $FILES
do
	awk -F"/" '{print $3 " " $5}' <<< "$file"
	for gr_year in $GR_YEARS
	do
		for ans_num in {25..0}
		do
			MAX_STUDENTS=($(grep "[a-zA-Z];$gr_year;$ans_num" $file | awk -F";" '{print $2}'))
			if [ ${#MAX_STUDENTS[@]} -ne 0 ]
			then
				echo "In $gr_year students with maximum result ($ans_num correct answers):"
				echo ${MAX_STUDENTS[@]}
				break
			fi
		done
	done
done