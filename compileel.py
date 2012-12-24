# Time-stamp: <2012-12-24 13:02:42 Monday by djzhang>

# @version 1.0
# @author djzhang


#build.py

# template:
# c#   :build.bat
# c++  : 


import sys
import re
import os
import string
import subprocess

    

def compile_el_in_subdir(base):
    #print(base)      
    cur_list = os.listdir(base)  
    for item in cur_list:
        split=item.split(".")
        slen=len(split)
        if slen >1 :
            if split[slen-1] != "el":
               #print(split[slen-1])
               continue  
          
        full_path = os.path.join(base, item)  
              
        # print full_path  
        bfile = os.path.isfile(item)  
        if os.path.isfile(full_path) :
            if slen >1 :
                print(full_path)
                ExeByCmd(full_path)
                pass
        else:
            compile_el_in_subdir(full_path)
            
            
def ExeByCmd(buildpath):
    emacs_exe="\"d:/TC_UP/PLUGINS/SoftwareFiles/gnuemacs/GNU Emacs for Windows v23.3/bin/emacs.exe\""
    p=subprocess.Popen("cmd.exe",shell=True,stdout=subprocess.PIPE,stdin=subprocess.PIPE,stderr=subprocess.PIPE)
    #p.stdin.write("ping www.baidu.com"+"\n")
    #$ emacs -batch -f batch-byte-compile  filename
    emacs_exe_el=emacs_exe+ "  -batch -f batch-byte-compile  \""+buildpath+"\""
    print(emacs_exe_el)
    p.stdin.write(emacs_exe_el)
    #p.stdin.write("dir")
    p.stdin.close()
    p.wait()
    print (p.stdout.read())
    


def console():
    compile_el_in_subdir(os.getcwd())
    #compile_el_in_subdir("z:\\123")
    
    

if __name__=="__main__":
    console()
