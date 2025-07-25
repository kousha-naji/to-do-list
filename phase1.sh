#! /bin/bash

echo "Hello"
option1="0" # Default value for task done or not
option2=""  # Default value for task title
option3="L" # Default value for task priority

if [ "$1" != "add" ] ; then
	exit 1
fi
shift

while [ -n "$1" ]; do
	case "$1" in
		-t | --title)
			if [ -z "$2" ]; then
				echo "Option -t|--title Needs a Parameter"
				exit 1
			fi
			option2="$2"
			shift 2
			;;
		-p | --priority)
			if [[ "$2" != "L" && "$2" != "M" && "$2" != "H" ]]; then
				echo "Option -p|--priority Only Accept L|M|H"
				exit 1
			fi
			option3="$2"
			shift 2
			;;
		*)
			echo "Unknown option: $1"
			exit 1
			;;
	esac	
done

if [ -z "$option2" ]; then
	echo "Option -t|--title Needs a Parameter"
	exit 1
fi

echo "$option1,$option3,\"$option2\"" >> tasks.csv
