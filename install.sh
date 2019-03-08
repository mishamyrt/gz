#!/bin/sh

gzUrl='https://raw.githubusercontent.com/mishamyrt/gz/master/gz.sh'
case "$(uname -s)" in
    Linux*)
        filePath=/usr/bin/gz
        ;;
    Darwin*)
        filePath=/usr/local/bin/gz
        ;;
    *)
        echo 'Sorry, only macOS and Linux are supported'
        exit
        ;;
esac
if [ ! -f $filePath ]; then
    sudo curl $gzUrl > ${filePath}
    sudo chmod +x ${filePath}
else
    echo 'GZ is already installed'
    exit
fi


