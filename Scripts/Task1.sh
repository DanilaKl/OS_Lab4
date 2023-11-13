#!/bin/bash

GROUP_NUMBER=$1

STUDENTS=$( cat labfiles/students/groups/$GROUP_NUMBER)
FILES=$(find ./labfiles/ -name "$GROUP_NUMBER-attendance")
MAX_ATTENDANCE=0
MAX_STUDENTS=()

for student in $STUDENTS
do
	ATTENDANCE=$(grep $student $FILES | grep -o "1" | grep -c "1")
# 	echo "$student: $ATTENDANCE"
	if [ $ATTENDANCE -gt $MAX_ATTENDANCE ] 
	then
		MAX_ATTENDANCE=$ATTENDANCE
		MAX_STUDENTS=($student)
	elif [ $ATTENDANCE -eq $MAX_ATTENDANCE ]
	then
		MAX_STUDENTS+=($student)
	fi
done

echo "Students with maximum attendance ($MAX_ATTENDANCE  studies):"
echo "${MAX_STUDENTS[@]}"