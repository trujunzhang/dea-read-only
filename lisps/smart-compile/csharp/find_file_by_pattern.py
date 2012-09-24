#encoding: utf-8

#!/usr/bin/env python

# Time-stamp: <2012-09-24 14:41:03 Monday by djzhang>

# @version 1.0
import os
import re


def find_file_by_pattern(pattern='.*', base=".", circle=True):
    '''查找给定文件夹下面所有 '''
    re_file = re.compile(pattern)
    if base == ".":
        base = os.getcwd()
        
    final_file_list = []
    #print base
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
        else:
           final_file_list += find_file_by_pattern(pattern, full_path)

    return final_file_list

