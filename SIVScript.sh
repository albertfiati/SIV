#!/bin/bash

MONITORING_DIR_EXISTS=false
VARIFICATION_FILE_IS_IN_MONITORING_DIR=false
REPORT_FILE_IS_IN_MONITORING_DIR=false
VARIFICATION_FILE_EXISTS=false
REPORT_FILE_EXISTS=false
ALLOWED_HASHES="MD-5" "SHA-1"
HASH_FUNCTION_IS_VALID=false


#initialization function
initialize(){
	#verify that monitoring folder exists
	if [ -d $1 ]; then
		

		#verify that the monitoring directory is different from the verification and report file directory

		if [[ ]]; then

			if []; then

				#verify that the hash function is supported
				if []; then

				else
					echo Hash function provided is not supported by the SIV
				fi
			else
				echo The report file lives inside the monitoring folder
			fi
		else
			echo The verification file lives inside the monitoring folder
		fi

	else
		echo The monitoring folder you specified does not exist
	fi
}

#check if monitoring directory exists
#$1 is the path to the directory to initialize monitoring on
monitoringDirectoryExists(){
	if [ -d $1 ]; then 
		MONITORING_DIR_EXISTS
	fi
}

#check if report file or verification file exists
#$1 is file type and $2 is the path to the file. 
#if $1==1 then filetype is verification
fileExists(){
	if [ $1 -eq 1 ]; then
		#verify if verification file exists
		if [ -f $2 ]; then 
			VARIFICATION_FILE_EXISTS=true
		fi
	else
		#verify if report file exists
		if [ -f $2 ]; then
			REPORT_FILE_EXISTS=true
		fi
	fi
}


#check if the hash function provided is supported
hashIsSupported(){
	for hashFn in $(ALLOWED_HASHES); do
		if [ hashFn == $1 ]; do
			HASH_FUNCTION_IS_VALID=true
			break
		fi
	done
}

#verify if the verification and report files are not in the monitoring directory
#$1 represents the filetype
#$2 represents the monitoring directory path
#$3 represents the file path
notInSameDirectory(){
	if [ $1==1 ]; then
		if [ sameDirectoryCheck $2 $3 ]; then
			VARIFICATION_FILE_IS_IN_MONITORING_DIR=true
		fi
	else
		if [ sameDirectoryCheck $2 $3 ]; then
			REPORT_FILE_IS_IN_MONITORING_DIR=true
		fi
	fi
}

sameDirectoryCheck(){
	if [[ $2==$1* ]]; then
		return 0
	fi

	return 1
}


