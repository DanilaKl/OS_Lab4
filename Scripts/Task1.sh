#!/bin/bash

GROUP_NUMBER=$1
STORAGE_PATH=$2

CHECK=$(find $STORAGE_PATH/students/groups -name "$GROUP_NUMBER")
if [ ${#CHECK} -ne 0 ]
then
	STUDENTS=$( cat $STORAGE_PATH/students/groups/$GROUP_NUMBER)
	FILES=($(find $STORAGE_PATH -name "$GROUP_NUMBER-attendance"))
	MAX_ATTENDANCE=0
	MAX_STUDENTS=()

	for student in $STUDENTS
	do
		ATTENDANCE=$(grep "$student " $FILES | grep -o "1" | grep -c "1")
		if [ $ATTENDANCE -gt $MAX_ATTENDANCE ] 
		then
			MAX_ATTENDANCE=$ATTENDANCE
			MAX_STUDENTS=($student)
		elif [ $ATTENDANCE -eq $MAX_ATTENDANCE ]
		then
			MAX_STUDENTS+=($student)
		fi
	done

	if [ ${#MAX_STUDENTS} -lt ${#STUDENTS} ]
	then
		echo "Students with maximum attendance ($MAX_ATTENDANCE  studies):"
		echo "${MAX_STUDENTS[@]}"
	else
		echo "All students have maximum attendance ($MAX_ATTENDANCE  studies):"
		echo "${MAX_STUDENTS[@]}"
	fi
else
	echo "Wrong group number"
fi