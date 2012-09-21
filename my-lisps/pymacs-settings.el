;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-05-20 20:41:28 Sunday by Administrator>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.


;; http://ax003d.appspot.com/?p=29001

;; 1
;; (setenv "PYMACS-PYTHON" "c:/Python27/python.exe")  

(require 'file-search)


 (setenv "PYMACS-PYTHON" "e:/ProgramLibrary/Portable/Portable Python 2.7.2.1/App/python.exe")  
 
;;2. 修改 .emacs 文件，添加如下信息

 (autoload 'pymacs-apply "pymacs")
 (autoload 'pymacs-call "pymacs")
 (autoload 'pymacs-eval "pymacs" nil t)
 (autoload 'pymacs-exec "pymacs" nil t)
 (autoload 'pymacs-load "pymacs" nil t)

 (setq pymacs-path (concat   my-emacs-lisps-path "python-mode"))
 (eval-after-load "pymacs"
   '(add-to-list 'pymacs-load-path pymacs-path))
   ;'(add-to-list 'pymacs-load-path pymacs-path))

;输入命令：
;   M-x pymacs-eval RET RET 2**3 RET
;   如果在 mini buffer 处显示 8，则说明 Pymacs 工作正常至此，Pymacs 安装结束

;; 3. 写一个 Pymacs 扩展
;; 在存放 *.el 文件的地方新建一个 Python 文件 mangler.py，编写如下脚本：
;; from Pymacs import lisp
;; interactions = {}
;; def break_on_whitespace():
;;     start, end = lisp.point(), lisp.mark(True)
;;     words = lisp.buffer_substring(start, end).split()
;;     lisp.delete_region(start, end)
;;     lisp.insert('\n'.join(words))
;; interactions[break_on_whitespace] = ''

;;4. 修改 .emacs 文件，加载 Pymacs 扩展：

;; (setq manglerpath (concat   my-emacs-my-lisps-path "mangler.py"))
;;(pymacs-load manglerpath)

;;5. 重启 emacs
;6. 选中一段文本，输入如下命令：
;   M-x mangler-break-on-whitespace
;   文本首先按空格切割，然后用换行符连接至此，一个 Pymacs 的扩展完成

;;1. 
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))


;(setq pythonshell (concat (getenv "PYMACS-PYTHON") "\python.exe"))

(defun testwanghao(a b)
   (print b)
  )

(defun wanghao123()
  "wanghao123"
   (interactive)
   (wanghaotools)
  )

 (defun python-compile123 ()
   "Use compile to run python programs"
   (interactive)
   (save-buffer)
   (
    setq compile-path
(         
     concat "\"e:/ProgramLibrary/Portable/Portable Python 2.7.2.1/App/python.exe\" " (buffer-file-name)
            )
         )
   (
    
    compile
    (
     compile-path
            )
            )
   )


 (defun python-compile ()
   "Use compile to run python programs"
   (interactive)
   (save-buffer)
   (defconst my-python-develop-path (concat my-emacs-path "develop\\build.py "))
   (setq compile-cmd (concat "\"e:/ProgramLibrary/Portable/Portable Python 2.7.2.1/App/python.exe\" " my-python-develop-path))
   ;;(setq buffer-paras-left (concat "'" (buffer-file-name)))
   ;;(setq buffer-paras (concat  buffer-paras-left "'"))
   ;;(setq compile-paras (concat compile-cmd buffer-paras))
   (setq compile-paras (concat compile-cmd (buffer-file-name)))
   (compile compile-paras)
 )
 (setq compilation-scroll-output t)
  (global-set-key [(f9)] 'python-compile)


;;5. pdb调试
;;在Emacs中，通过M-x pdb可调出pdb对python代码进行调试。但是发现在Windows系统中，总进入不了调试模式。主要原因有：
;;1. windows中，找不到pdb.py位置。需自己制定pdb的路径。可以通过下面的方法设置pdb的路径：
;; pdb setup, note the python version
;;(setq pdb-path "e:/ProgramLibrary/Portable/Portable Python 2.7.2.1/App/Lib/pdb.py"
;;       gud-pdb-command-name (symbol-name pdb-path))
;; (defadvice pdb (before gud-query-cmdline activate)
;;   "Provide a better default command line when called interactively."
;;   (interactive
;;    (list (gud-query-cmdline pdb-path
;;                 (file-name-nondirectory buffer-file-name)))))

(message "  ")
(message "=====================================================  ")
(message " Loading pymacs-settings")
(message "=====================================================  ")
(message "  ")

(provide 'pymacs-settings)

