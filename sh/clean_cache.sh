#!/bin/bash

echo "Cleanning Wordkspace...."

#find . -type f -name *.obj     // f 文件
 
# rm *cache*
find "$workpath" -type d -name "*vs" -o -name "*idea" -o -name "*build" -exec rm -rf {} +

find ./ -name "*.log" -d -exec rm {} \;

find ./ -name ".DS_Store" -d -exec rm {} \;

echo "All Done!"
