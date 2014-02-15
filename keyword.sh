#! /bin/bash


###############################################################
# function: find all files that contain the keyword under DIR
# author: zhaohui.csu@gmail.com
# date: 2014-2-15
##############################################################

# check parameters
if [ $# -ne 2 ]; then
    echo -e "[USAGE]: sh -x keyword.sh DIR KEYWORD" 1>&2
    exit 0
fi

DIR=$1
KEYWORD=$2
echo "---------------------------------------------------"
find ${DIR} -type f | while read line;do
    file_type=`file ${line}| grep "text"`
    if [ "${file_type}" != "" ]; then
        # search keywords in text files
        temp=`grep ${KEYWORD} ${line}`
        if [ "${temp}" != "" ]; then
            echo ${line}
        fi
    fi
done | awk '{print $0;}END{print NR" file is found!";}'
echo "---------------------------------------------------"

exit 0

