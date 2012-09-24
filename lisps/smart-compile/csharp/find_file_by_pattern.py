#encoding: utf-8

#!/usr/bin/env python

# Time-stamp: <2012-09-24 16:32:52 Monday by djzhang>

# @version 1.0
import os
import re

def GetParentPath(strPath):  
    if not strPath:  
        return None;  
      
    lsPath = os.path.split(strPath);  
    #print(lsPath);  
    #print("lsPath[1] = %s" %lsPath[1]);  
    if lsPath[1]:  
        return lsPath[0];  
      
    lsPath = os.path.split(lsPath[0]);  
    return lsPath[0];  


def find_file_by_pattern(pattern='.*', base=".", circle=True):
    '''查找给定文件夹下面所有 '''
    re_file = re.compile(pattern)
    if base == ".":
        base = os.getcwd()
        
    final_file_list = []
    #print base
    if not os.path.exists(base):
        return final_file_list

    cur_list = os.listdir(base)
    for item in cur_list:
        if item == ".svn":
            continue
        
        full_path = os.path.join(base, item)
        if full_path.endswith(".doc") or\
           full_path.endswith(".bmp") or\
           full_path.endswith(".wpt") or\
           full_path.endswith(".dot"):
            continue

            
        # print full_path
        bfile = os.path.isfile(item)
        if os.path.isfile(full_path):
           if re_file.search(full_path):
               print (str.format("{0}: {1}","full_path",full_path))
               pathsplit=os.path.splitext(item)
               ##print pathsplit[1]
               if pathsplit[1] == pattern:
                   final_file_list.append(full_path)
        elif circle:
           final_file_list += find_file_by_pattern(pattern, full_path)

    return final_file_list

def find_up_file_by_pattern(pattern='.*', base="."):
    final_file_list = []
    parent=base
    x = [1,2,3,4]
    for i in x:
        parent=GetParentPath(parent)
        files=find_file_by_pattern(pattern, parent,False)
        if len(files) >0:
#            print "fond************"
            final_file_list.append(files[0])
            break
#        print parent
#        print "................................................."
    
    return final_file_list

    
    

    
    
    



