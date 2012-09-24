#encoding:utf-8


#!/usr/bin/env python

# Time-stamp: <2012-09-24 16:07:50 Monday by djzhang>

# @version 1.0
# @author ahei


import string
import sys
import os

from find_file_by_pattern import *


def logmsg(msg):
    print msg

def logmsgbyinfo(info,msg):
    print (str.format("{0}: {1}",info,msg))
    

def ShowException(e_para,type):
    print "................ ******* ......................."
    print ".................. *** ........................."
    print (str.format("{1}: not found build file",e_para,type))
    logmsgbyinfo("e_para",e_para)
    print ".................. *** ........................."
    print "................ ******* ......................."



## sys.argv
## 1 : local path
## 2 : event type
def nant_helper():
    print "................................................."
    print "                 nant build   "       
    print "................................................."
    
    e_type = ""
    e_pattern = ".build"
    e_base = ""
    e_para=""
    logmsgbyinfo("argv's leng",len(sys.argv))
    e_s=1
    for arg in sys.argv:
        logmsgbyinfo(e_s,arg)
        e_s=e_s+1
    print "................................................."    
    ## 获得参数
    if len(sys.argv) > 1:
        e_para=sys.argv[1]
        strlist=e_para.split(";")
        logmsgbyinfo("strlist's leng",len(strlist))
        e_s=1
        for value in strlist:	# 循环输出列表值
            logmsgbyinfo(e_s,value)
            e_s=e_s+1
        print "................................................."    
        if len(strlist) ==2:
            e_base = strlist[0]
            e_type = strlist[1]


#    if not os.path.exists(e_base) :
#        ShowException(e_para,"exist")
#        return

    ## find special file by argv
#    try:
        files = find_file_by_pattern(e_pattern, e_base)
        files_len=len(files)
        logmsgbyinfo("[1]: down findsize",files_len)
        print "................................................."
        if files_len < 1:
            files = find_up_file_by_pattern(e_pattern, e_base)
            files_len=len(files)
            logmsgbyinfo("[2]: up findsize",files_len)
            print "................................................."
        
        if files_len > 0:
            nant_event(files[0],e_type)
        else:
            ShowException(e_para,"info")

        #s1=sys.argv[5]
#    except :
#        ShowException(e_para,"exception")



    



def nant_event(e_buildfile,e_type):
    logmsgbyinfo ("e_buildfile",e_buildfile)
    logmsgbyinfo ("e_type",e_type)
    print "................................................."    
    
    nant_shell=str.format("nant -buildfile:\"{0}\" {1}",e_buildfile,e_type)
    logmsgbyinfo ("nant_shell",nant_shell)
    print "................................................."    
    
    os.system(nant_shell)




if __name__ == '__main__':
    nant_helper()
    ##nant_event("","")
