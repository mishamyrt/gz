#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "You shoud pass file name to gz"
    exit
fi
temp=$(mktemp -d)
original_size=$(wc -c < $1 | xargs) 
yellow='\033[0;33m'
green='\033[0;32m'
nc='\033[0m'
zip $temp/zip $1 > /dev/null
gzipped_size=$(wc -c < $temp/zip.zip | xargs)
rm -r "${temp}"
diff=$(echo "scale=4;(${gzipped_size} / ${original_size}) * 100" | bc -l | cut -c 1-5)
echo -e "Original size: ${yellow}${original_size} bytes${nc}"
echo -e "GZiped size: ${yellow}${gzipped_size} bytes${nc} (${diff}%)"
