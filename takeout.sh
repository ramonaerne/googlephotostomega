#!/bin/bash
OUT=~/MEGA/takeout
IN=.

mkdir -p $OUT/json
# including loop through files and subfolders
IFS=$'\n'; set -f
for FILE in $(find $IN -name '*.jpg' -or -name '*.mp4' -or -name '*.JPG'); do 

	if [ ! -f $FILE.json ]; then
		echo "skip $FILE no metainfo"
		continue
	fi
	echo "$FILE"
	MOD_STAMP=`cat $FILE.json | jq -r .photoTakenTime.timestamp`
	# modification time
	touch -mt $(date -r $MOD_STAMP +%Y%m%d%H%M) $FILE
	# filename
	ENDING=`echo $FILE | awk -F. '{print tolower($NF)}'`

	MFILE=`date -r $MOD_STAMP +"%Y-%m-%d %H.%M.%S.$ENDING"`
	#echo "mv $FILE.json $OUT/json/$MFILE.json"
	echo "mv $FILE $OUT/$MFILE"
	mv "$FILE.json" "$OUT/json/$MFILE.json"
	mv "$FILE" "$OUT/$MFILE"
done
unset IFS; set +f