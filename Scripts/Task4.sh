#!/bin/bash

GROUP_NUMBER=$1

FILES=$(find ./labfiles/ -name "$GROUP_NUMBER-attendance")
MIN_ATTENDANCE=0
MIN_LESSONS=()

for  file in $FILES
do
	awk -F"/" '{print $3}' <<< "$file"
	LESSONS_STR=$(tail -n 1 $file | grep -o "[0-1]*")
	for (( i=0; i<${#LESSONS_STR}; i++))
	do
		ATTENDANCE=$(sed  "s/[a-zA-Z]* [0-1]\{$i\}\([0-1]\)[0-1]*/\1/g" $file | grep -c "0")
		if [ $ATTENDANCE -gt $MIN_ATTENDANCE ] 
		then
			MIN_ATTENDANCE=$ATTENDANCE
			MIN_LESSONS=($((i+1)))
		elif [ $ATTENDANCE -eq $MIN_ATTENDANCE ]
		then
			MIN_LESSONS+=($((i+1)))
		fi
	done
	echo "Lessons with minimum attendance ($MIN_ATTENDANCE  missing):"
	echo "${MIN_LESSONS[@]}"
done