#encoding:utf-8


#!/usr/bin/env python

# Time-stamp: <2012-09-23 09:48:20 Sunday by djzhang>

# @version 1.0
# @author ahei
import sys

from find_file_by_pattern import find_file_by_pattern


## sys.argv
## 1 : local path
## 2 : event type
def nant_helper():
    e_type = ""
    e_pattern = "default"
    e_base = "z:"
    #print len(sys.argv)
    ## 获得参数
    if len(sys.argv) > 1:
        print "split string <<<<"
        e_para=sys.argv[1]
        print e_para
        strlist=e_para.split(";")
        #print strlist
        print len(strlist)
        for value in strlist:	# 循环输出列表值
            print value
        print "split string  >>>"
        if len(strlist) ==2:
            e_base = strlist[0]
            e_type = strlist[1]
            print e_base
            print e_type

    ## find special file by argv
    try:
        files = find_file_by_pattern(e_pattern, e_base)
        if files.count > 0:
            nant_event(files[0],e_type)
    except :
        print "exception"


def nant_event(e_base,e_type):
    print "nant event<<<"
    print e_base
    print e_type
    print "nant event>>>"



if __name__ == '__main__':
    nant_helper()