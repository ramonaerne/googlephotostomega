# googlephotostomega
Tool to move google photos to mega by preserving image information.

This is a simple bash script that will iterate through an unziped and pre-merged google takeout folder and do the following to each file
1. Read the photoTakenTime timestamp via the `jq` tool
2. Modify the modification time of the image
3. Rename the image in the format 'YYYY-MM-DD HH.MM.SS' as is done with MEGA camera upload
4. Move the file to a local folder that is synchronized with mega

All that is left to do is move the contents of this folder in MEGA into the camera upload folder or where ever you want it. Notice that the modification time is changed due to the fact that MEGA sorts its pictures according to this timestamp.

# 1. Export your google photos via google takeout
See [takeout.google.com](takeout.google.com), i exported only google photos including all albums and exported it in chunks of 2GB. Wait for the google link and download all chunks

# 2. Unzip and Merge
Unzip all chunks and Merge all folders. On Mac OS e.g. like here [dealing-with-goggle-takeout-in-mac-os](https://codingstick.com/2019/07/12/dealing-with-goggle-takeout-in-mac-os/) which essentially uses the ditto command like the following
```
ditto -x -k -V takeout-20190710T165610Z-001.zip \
	takeout-20190710T165610Z-002.zip \
	takeout-20190710T165610Z-003.zip \
	takeout-20190710T165610Z-004.zip \
	takeout-20190710T165610Z-005.zip \
	takeout-20190710T165610Z-006.zip \
	takeout-20190710T165610Z-007.zip \
	takeout-20190710T165610Z-008.zip \
	takeout-20190710T165610Z-009.zip \
	takeout-20190710T165610Z-010.zip \
	result 1>log.txt 2>&1
```

# 3. Adapt the script to your needs
There is some variables you should adapt before running the script yourself
```
OUT=path/to/mega/synchronized/folder
IN=path/to/gogle/takeout/folder
```

