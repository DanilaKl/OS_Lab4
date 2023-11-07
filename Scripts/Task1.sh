#!/bin/bash

GROUP_NUMBER=$1

STUDENTS=$( cat labfiles/students/groups/$GROUP_NUMBER)
FILES=$(find ./labfiles/ -name "$GROUP_NUMBER-attendance")
MAX_ATTENDANCE=0
MAX_STUDENT=""
# for file in $FILES 
# do
for student in $STUDENTS
do
	ATTENDANCE=$(grep $student $FILES | grep -o "1" | grep -c "1")
	if [ $ATTENDANCE -gt $MAX_ATTENDANCE ] 
	then
		MAX_ATTENDANCE=$ATTENDANCE
		MAX_STUDENT=$student
	fi
done
echo "$MAX_STUDENT: $MAX_ATTENDANCE"
# done