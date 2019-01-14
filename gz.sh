#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "You shoud pass single file path"
    exit
fi
temp=$(mktemp -d)
original_size=$(wc -c < $1 | xargs) 
yellow='\033[0;33m'
nc='\033[0m'
zip $temp/zip $1 > /dev/null
gzipped_size=$(wc -c < $temp/zip.zip | xargs)
rm -r "${temp}"
diff=$(printf "%.1f\n" $(echo "scale=4;(${gzipped_size} / ${original_size}) * 100" | bc -l))
echo $n
echo -e "Original size: ${yellow}${original_size} bytes${nc}"
echo -e "GZiped size: ${yellow}${gzipped_size} bytes${nc} (${diff}%)"
