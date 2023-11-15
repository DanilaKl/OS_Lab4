#!/bin/bash

GROUP_NUMBER=$1
STORAGE_PATH=$2

CHECK=$(find $STORAGE_PATH/students/groups -name "$GROUP_NUMBER")
if [ ${#CHECK} -ne 0 ]
then
	FILES=$(find $STORAGE_PATH -name "$GROUP_NUMBER-attendance")
	MIN_LESSONS=()

	for  file in $FILES
	do
		awk -F"/" '{print $(NF-1)}' <<< "$file"
		LESSONS_STR=$(tail -n 1 $file | grep -o "[0-1]*")
		MAX_ABSENCE=-1
		for (( i=0; i<${#LESSONS_STR}; i++))
		do
			ABSENCE=$(sed  "s/[a-zA-Z]* [0-1]\{$i\}\([0-1]\)[0-1]*/\1/g" $file | grep -c "0")
			if [ $ABSENCE -gt $MAX_ABSENCE ] 
			then
				MAX_ABSENCE=$ABSENCE
				MIN_LESSONS=($((i+1)))
			elif [ $ABSENCE -eq $MAX_ABSENCE ]
			then
				MIN_LESSONS+=($((i+1)))
			fi
		done
		
		if [ $MAX_ABSENCE -ne -1 ]
		then
			echo "Lessons with minimum attendance ($MAX_ABSENCE  missing):"
			echo "${MIN_LESSONS[@]}"
		else
			echo "All lessons were attended by all students"
		fi 
	done
else
	echo "Wrong group number"
fi