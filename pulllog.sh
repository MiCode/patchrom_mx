#! /bin/bash
#
#pull log from /data/system/dropbox

# upload for add exec permission

ROOT_END=root_end
ROOT_START=root_start
DATA_FORMAT=dataformat.sh
LOG_DIR=log
OLD_PWD=`pwd`
LOG_FILE=${LOG_DIR}/${LOG_DIR}-`date +"%Y%m%d-%H%M"`

if [ ! -d $LOG_DIR ]; then
	mkdir $LOG_DIR
	test $? != 0 && exit
fi

if [ ! -d $LOG_FILE ]; then
	mkdir $LOG_FILE
	test $? != 0 && exit
fi

adb wait-for-device
echo `adb shell id` | grep "uid=0"

if [ $? != 0 ]; then
	test ! -e $ROOT_START && exit
	. ${ROOT_START}
fi

adb pull /data/system/dropbox ${LOG_FILE}
adb shell rm /data/system/dropbox/*

test ! -e $DATA_FORMAT
. ${DATA_FORMAT} ${LOG_FILE}

echo "creat dir $LOG_FILE"

cd $OLD_PWD

test ! -e $ROOT_END && exit
. ${ROOT_END}


