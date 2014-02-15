#!/bin/bash

#############################################
# function: rm .svn folders
# author: zhaohui.csu@gmail.com
# date: 2014-2-15
#############################################

if [ $# -ne 1 ];then
    echo "[USAGE]: sh rmsvn.sh DIR"
    exit 1
fi

DIR=$1
if [ -d ${DIR} ];then
    find ${DIR} | grep "[^\.]*/.svn" | xargs rm -rf 
else
    echo "DIR not exist!" 1>&2
fi

exit 0
