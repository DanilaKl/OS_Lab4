SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

display () {
	clear
	printf "%0.s=" {1..80}; printf "\n"
	echo "OUTPUT:"
	cat $SCRIPT_DIR/output_file
	printf "%0.s=" {1..80}; printf "\n"
	echo "OPTIONS LIST:"
	echo "1) Task1: Find students with maximum attedance in the Group"
	echo "2) Task2: Find students with maximum 5/4/3 on tests"
	echo "3) Task3: Find students with best results for yeach years"
	echo "4) Task4: Find lessons with minimum total attendance"
	echo "5) Task5: Find lessons with maximum total attendance"
	echo "6) QUIT"
	printf "%0.s=" {1..80}; printf "\n"
	echo "SELECT OPTION: "
}

input_in_file () {
	printf "%0.s-" {1..80} > $SCRIPT_DIR/output_file
	printf "\n" >> $SCRIPT_DIR/output_file
	echo $@ >> $SCRIPT_DIR/output_file
	printf "%0.s-" {1..80} >> $SCRIPT_DIR/output_file
	printf "\n" >> $SCRIPT_DIR/output_file
}

UI_STOP=0

echo "..." > $SCRIPT_DIR/output_file
while [ $UI_STOP -eq 0 ]
do
		display
		
		read symbol
		
		case $symbol in
		
		1)
			echo "Input group number (format: A-00-00) and path to file"
			read group_number storage_path
			input_in_file $group_number $storage_path
			$SCRIPT_DIR/Task1.sh $group_number $storage_path >> $SCRIPT_DIR/output_file
			;;
		
		2)
			echo "Input group number (format: A-00-00) and path to file"
			read group_number storage_path
			input_in_file $group_number $storage_path
			$SCRIPT_DIR/Task2.sh $group_number $storage_path >> $SCRIPT_DIR/output_file
			;;
		
		3)
			echo "Input range of years (two number separated by a SPACE) and path to file"
			read year_start year_end storage_path
			input_in_file $year_start $year_end $storage_path
			$SCRIPT_DIR/Task3.sh $year_start $year_end $storage_path >> $SCRIPT_DIR/output_file
			;;
		
		4)
			echo "Input group number (format: A-00-00) and path to file"
			read group_number storage_path
			input_in_file $group_number $storage_path
			$SCRIPT_DIR/Task4.sh $group_number $storage_path >> $SCRIPT_DIR/output_file
			;;
			
		5)
			echo "Input group number (format: A-00-00) and path to file"
			read group_number storage_path
			input_in_file $group_number $storage_path
			$SCRIPT_DIR/Task5.sh $group_number $storage_path >> $SCRIPT_DIR/output_file
			;;
		
		6)
			echo "Do you want to exit? Type [Y/N]"
			while read sure_exit
			do
				sure_exit=$(echo $sure_exit | sed "s/\([yYnN]\).*/\1/")
				if [ \( $sure_exit = "Y" \) -o \( $sure_exit = "y" \) ]
				then
					UI_STOP=1
					echo "Exeating..."
					break
				elif [ \( $sure_exit = "N" \) -o \( $sure_exit = "n" \) ]
				then
					echo "Back to the future"
					break
				else
					echo "Incorrect symbol"
				fi
			done
			;;
		
		*)
			echo "Unknown operation" > $SCRIPT_DIR/output_file
			;;
		esac
done

rm $SCRIPT_DIR/output_file