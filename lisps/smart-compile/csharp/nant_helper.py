#encoding:utf-8


#!/usr/bin/env python

# Time-stamp: <2012-09-23 14:42:36 Sunday by djzhang>

# @version 1.0
# @author ahei
import string
import sys
import os

from find_file_by_pattern import find_file_by_pattern


def logmsg(msg):
    print msg

## sys.argv
## 1 : local path
## 2 : event type
def nant_helper():

    e_type = ""
    e_pattern = "default"
    e_base = "z:"
    e_para=""

    #logmsg (len(sys.argv))
    ## 获得参数
    if len(sys.argv) > 1:
        logmsg ("split string <<<<")
        e_para=sys.argv[1]
        logmsg( e_para)
        strlist=e_para.split(";")
        #logmsg strlist
        logmsg (len(strlist))
        for value in strlist:	# 循环输出列表值
            logmsg (value)
        logmsg ("split string  >>>")
        if len(strlist) ==2:
            e_base = strlist[0]
            e_type = strlist[1]
            logmsg (e_base)
            logmsg (e_type)

    ## find special file by argv
    try:
        files = find_file_by_pattern(e_pattern, e_base)
        if files.count > 0:
            nant_event(files[0],e_type)

    except :
        print (str.format("exception:not found build file, [{0}]",e_para))




def nant_event(e_buildfile,e_type):
    logmsg ("nant event<<<")
    logmsg (e_buildfile)
    logmsg (e_type)
    logmsg ("nant event>>>")
    nant_shell=str.format("nant -buildfile:\"{0}\" {1}",e_buildfile,e_type)
    logmsg (nant_shell)
    os.system(nant_shell)




if __name__ == '__main__':
    nant_helper()
    ##nant_event("","")
