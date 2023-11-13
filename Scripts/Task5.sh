#!/bin/bash

GROUP_NUMBER=$1

FILES=$(find ./labfiles/ -name "$GROUP_NUMBER-attendance")
MAX_ATTENDANCE=0
MAX_LESSONS=()

for  file in $FILES
do
	awk -F"/" '{print $3}' <<< "$file"
	LESSONS_STR=$(tail -n 1 $file | grep -o "[0-1]*")
	for (( i=0; i<${#LESSONS_STR}; i++))
	do
		ATTENDANCE=$(sed  "s/[a-zA-Z]* [0-1]\{$i\}\([0-1]\)[0-1]*/\1/g" $file | grep -c "1")
		if [ $ATTENDANCE -gt $MAX_ATTENDANCE ] 
		then
			MAX_ATTENDANCE=$ATTENDANCE
			MAX_LESSONS=($((i+1)))
		elif [ $ATTENDANCE -eq $MAX_ATTENDANCE ]
		then
			MAX_LESSONS+=($((i+1)))
		fi
	done
	echo "Lessons with maximum attendance ($MAX_ATTENDANCE  present):"
	echo "${MAX_LESSONS[@]}"
done