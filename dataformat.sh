#! /bin/bash

# upload for add exec permission
#format date to YMDhms,
#if len > 12, truncat 

test $# != 1 && echo "input $# args" && exit


DIR=$1
if [ -d $1 ] ; then
	cd $1
	test $? != 0 && echo "enter $1 failed" && exit
	DIR=""
fi

rm SYSTEM_BOOT*
rm event*

DIR=`pwd`
echo $DIR

for file in `ls $(DIR) | grep "\.gz$"`
do
	gunzip $file
done

for file in `ls $(DIR) | grep "SYSTEM_LAST_KMSG"`
do
	grep -nr "exception" $file
	test $? != 0 && rm $file
done

for file in `ls $(DIR) | grep "@[0-9]\+\."`
do
	    #oldtime=`echo $file | gawk -F@ '{printf$2}' | awk '{print substr(,1,10)}'`
	    oldtime=`echo $file | gawk -F@ '{printf$2}' | cut -c 1-10`
		echo $oldtime
		# truncat ,format seconds
		newtime=`date -d "1970-01-01 UTC $oldtime seconds" +"%Y%m%d-%H%M%S"`
		echo $newtime
		#newfile=`echo $file | sed "s/@[0-9]*\./-$newtime\./g"`
		newfile=`echo ${file/@*\./-$newtime\.}`
#		newfile=`echo ${newfile/\.gz/\.txt}`
		echo $newfile
		mv $file $newfile
done

