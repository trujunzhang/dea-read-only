#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Time-stamp: <2012-05-18 22:05:49 Friday by Administrator>

# @version 1.0
# @author ahei


#build.py

# template:
# c#   :build.bat
# c++  : 


import sys
import re
import os
import subprocess


def find_file_by_pattern(pattern='.*', base=".", circle=True):  
    '''''查找给定文件夹下面所有 '''  
    re_file = re.compile(pattern)  
    if base == ".":  
        base = os.getcwd()  
          
    final_file_list = []  
    cur_list = os.listdir(base)  
    for item in cur_list:  
        if item == ".svn":  
            continue  
          
        full_path = os.path.join(base, item)  
              
        # print full_path  
        bfile = os.path.isfile(item)  
        if os.path.isfile(full_path):  
            if (full_path.find(pattern))>0:
                #print "full path:",full_path
                #print "pattert:",pattern
                final_file_list.append(full_path)  
        else:  
           final_file_list += find_file_by_pattern(pattern, full_path)  
    return final_file_list  


def console():
    print "  "
    path=ListArgv()
    print "*** Path in paras]",path
    if len(sys.argv)>=2:
        event(path)

def ListArgv():
    arg_len=len(sys.argv)
    print ("argv's len:",arg_len)
    path=""
    for i in range(1,arg_len):
        path=path+sys.argv[i]+" "
        #print sys.argv[i]
    return path    

    
def event(path):
    find_tag="sln"
    fold=os.path.dirname(path)
    for i in range(1,4):# 3 times
        print " "
        print "step:",i
        #print "........fold......: ",fold
        fold=os.path.dirname(fold)
        final_file_list=find_file_by_pattern(find_tag, fold)
        ListFindRes(final_file_list)
        if len(final_file_list)>=1:
            find_path=final_file_list[0]
            find_path=os.path.dirname(find_path)
            print ""
            print "*****************************************************************************"
            print "find path:",find_path
            print "*****************************************************************************"
            ExeByCmd(find_path)
            break
        else:
            print "not found",find_tag

def ListFindRes(final_file_list):
    find_len=len(final_file_list)
    print("find result: ",find_len)
    if find_len>=1:
        for i in range(0,find_len):
            print final_file_list[i]
    
    
    
    
def ExeByCmdtest():
    #os.system(find_path)
    print ""            
    print "======================================= [ out ]======================================"
    nant_exe="nant.exe"
    process = subprocess.Popen('cmd.exe dir ', shell=True, stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=None)
    print "[...ping current fold]"
    print "read line:",process
    process.stdin.close()
    print "============================================================================="

        

def ExeByCmd(buildpath):
    p=subprocess.Popen("cmd.exe",shell=True,stdout=subprocess.PIPE,stdin=subprocess.PIPE,stderr=subprocess.PIPE)
    #p.stdin.write("ping www.baidu.com"+"\n")
    p.stdin.write("cd "+buildpath+"\n")
    p.stdin.write("nant"+"\n")
    p.stdin.close()
    p.wait()
    print "execute result:",p.stdout.read()
    

if __name__=="__main__":
    console()
