#!/bin/bash

GROUP_NUMBER=$1
STORAGE_PATH=$2

STUDENTS=$( cat $STORAGE_PATH/students/groups/$GROUP_NUMBER)
FILES=$(find $STORAGE_PATH/ -name "TEST-[0-9]")

MAX_GRADES=(0 0 0)
MAX_STUDENTS=('' '' '')
COUNT_GRADES=(0 0 0)

for student in $STUDENTS
do
	GRADES=$(grep -h "^$GROUP_NUMBER;$student" $FILES | awk -F";" '{print $5 "\n"}')
	for grade in {3..5}
	do
		IND=$((grade-3))
	 	COUNT_GRADES[IND]=$(echo "$GRADES" | grep -c "$grade")
		if [ ${COUNT_GRADES[$IND]} -gt ${MAX_GRADES[$IND]} ]
		then
			MAX_GRADES[IND]=${COUNT_GRADES[$IND]}
			MAX_STUDENTS[IND]=$student
		elif [ ${COUNT_GRADES[$IND]} -eq ${MAX_GRADES[$IND]} ]
		then
			MAX_STUDENTS[IND]+=" $student"
		fi
	done
done

for grade in {3..5}
do
	if [ ${MAX_GRADES[$grade-3]} -gt 0 ]
	then
		echo "Students with maximum $grade (${MAX_GRADES[$grade-3]} grades): ${MAX_STUDENTS[$grade-3]}"
	else
		echo "No students with $grade"
	fi
done