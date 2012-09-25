;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-09-25 14:00:10 Tuesday by djzhang>

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


;; url: [http://www.cppblog.com/TianShiDeBaiGu/archive/2012/03/08/167421.html]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C++ 设置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (defconst c++-keywords
  (cons
     (regexp-opt
      (list "struct" "class" "public" "private" "interface" "virtual" "if" "for" "while" "protected" "static" "inline" "int"
            ) 'words)
     font-lock-keyword-face))

;; ;;(font-lock-add-keywords 'c++-mode (list c++-keywords) 'set)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;header
;;(require 'header)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dnc 
;; (load "dnc")
;;dnc扩展的C++关键字
;; (defconst c++-dnc-keywords
  ;; (cons
   ;; (regexp-opt
    ;; (list
     ;; "foreach" "foreach_r" "interface" "null" "foreign" "dself" "dthis" "dsuper"
     ;; "dtypeof" "decltype" "dcnew" "dcdel" "dtypename"  "dcdel_array" "dpnew"
     ;; "dpdel" "thread_value" "dnc_property_begin" "dnc_property_end" "dnc_property"
     ;; "dnc_property_set" "dnc_property_get" "dnc_event" "dref" "dnew" "dnc_property2"
     ;; "dnc_property_set2"     "dnc_property_get2" "dnc_class" "dnc_interface"
     ;; "dnc_struct" "true" "false" "static_assert"
     ;; ) 'words)
   ;; font-lock-keyword-face
   ;; ))

;; (font-lock-add-keywords 'c++-mode (list c++-dnc-keywords))

;; (add-hook 'c++-mode-hook
          ;; (lambda ()
            ;; (font-lock-add-keywords 
             ;; nil '(("\\(dnc_[A-Za-z_]+_begin\\|dnc_[A-Za-z_]+_end\\)" 
                    ;; (1 'dnc-begin-end-face)) 
                   ;; ("\\(dnc_cxxon_item_.*\\)(" 
                    ;; (1 'dnc-begin-end-entry-face))               
                   ;; ("#include +\\(\<.*\>\\|\".*\"\\)" 
                    ;; ;;("#include +\\(\<[a-z_.]+\>\\)" 
                    ;; (0 'c++-include-face))
                   ;; ("\\(dnc_class\\|dnc_interface\\|dnc_struct\\)" 
                    ;; (1 'c++-define-face))
                   ;; ("([ \n]*\\(\$[a-zA-Z_]+\\)," 
                    ;; (1 'c++-lisp-face))
                   ;; ("\\b\\([.]*[0-9]+[.a-zA-Z_]*\\)\\b"
                    ;; (1 'c++-number-face))
                   ;; ("\\(\+\\|\-\\|\[\\|\]\\|\*\\|==\\|!=\\|[.,!~:\{\}\(\);=%|&?\+\-\*/\>\<^]\\)" 
                    ;; (1 'c++-operator-face))
                   ;; )
             ;; )))

;; (defun dnc-cxxon-get-keyword(arg)
  ;; (let ((ret))
    ;; (message "--%s--" arg)
    ;; (setq ret (+ arg 1))
    ;; (setq ret nil)
    ;; ))

;;(font-lock-add-keywords 'c++-mode (list 'dnc-cxxon-get-keyword))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Makefile 
 (setq auto-mode-alist (append auto-mode-alist
                               '( ("\\.ma?k\\'" . makefile-mode)
                                  ("\\(M\\|m\\|GNUm\\)akefile\\(\\.in\\)?" . makefile-mode)
                                  ("\\.cfg\\'" . makefile-mode)
                                  )))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 (global-ede-mode 1)                      ; Enable the Project management system
 (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
 ;; Enable source code folding

 (semantic-load-enable-code-helpers)
;; Key bindings
 (defun my-cedet-hook ()
   (local-set-key [(control return)] 'semantic-ia-complete-symbol)
   (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
   (local-set-key "\C-cd" 'semantic-ia-fast-jump)
   (local-set-key "\C-cr" 'semantic-symref-symbol)
   (local-set-key "\C-cR" 'semantic-symref))
 (add-hook 'c-mode-common-hook 'my-cedet-hook)

;;;; 当输入"."或">"时，在另一个窗口中列出结构体或类的成员
 (defun my-c-mode-cedet-hook ()
   (local-set-key "." 'semantic-complete-self-insert)
   (local-set-key ">" 'semantic-complete-self-insert))
 (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)


;;(require 'ecb)
 (setq ecb-auto-activate t
       ecb-tip-of-the-day nil)
;(ecb-hide-ecb-windows)

;;;; 隐藏和显示ecb窗口
;; (define-key global-map [(control f2)] 'ecb-deactivate)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ecb
(setq g-switch-ecb-flag t)
(defun switch-ecb-activate()
  (interactive)
  (if g-switch-ecb-flag
      (progn
        (setq g-switch-ecb-flag nil)
        (ecb-activate))
    (progn
      (setq g-switch-ecb-flag t)
      (ecb-deactivate))))

(setq g-previous-buffer-name nil)
(defun switch-ecb-edit-window()
  "在ECB窗口和编辑窗口之间进行切换"
  (interactive)
  (let ((current-buffer-name (buffer-name)))
    (if (or (string= current-buffer-name " *ECB Directories*")
            (string= current-buffer-name " *ECB Sources*")
            (string= current-buffer-name " *ECB Methods*")
            (string= current-buffer-name " *ECB History*"))
        (ecb-goto-window-edit-last)
      (progn
        (if (string= g-previous-buffer-name " *ECB Directories*")
            (ecb-goto-window-directories)()
            (if (string= g-previous-buffer-name " *ECB Sources*")
                (ecb-goto-window-sources)()
                (if (string= g-previous-buffer-name " *ECB Methods*")
                    (ecb-goto-window-methods)()
                    (if (string= g-previous-buffer-name " *ECB History*")
                        (ecb-goto-window-history)()
                        (ecb-goto-window-methods)))))))
    (setq g-previous-buffer-name current-buffer-name)
    ))

(define-key global-map [(control f1)] 'switch-ecb-activate)
(define-key global-map [(control f2)] 'switch-ecb-edit-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c/c++
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 定位：窗口切换，翻页，文件切换

;; 源代码文件跳转
(setq ff-other-file-alist
      '((".h" (".cpp" ".c" ".cpt" ".cc"))
        (".cpp" (".h"))
        (".cc"  (".h"))
        (".c"   (".h"))
        (".cpt" (".h"))
        (".ct"  (".h"))))



;;==============================================================================
;; c/c++

;;(defun my-c++-mode-hook()
;;  (setq tab-width 2 indent-tabs-mode nil)
;;)
;;(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;;cscope查找设置
;(global-set-key "\C-cf" 'cscope-find-global-definition);;搜索定义
;(global-set-key"\C-d"'cscope-find-global-definition)
;(global-set-key[C-,]'cscope-pop-mark);;跳出转向;;设置Alt+Enter为自动补全菜单

;(global-set-key[(f6)]'cscope-set-initial-directory)
;(define-keyglobal-map[(controlf4)]'cscope-unset-initial-directory)
;(global-set-key[(f3)]'cscope-find-this-symbol)
;(global-set-key[(f4)]'cscope-find-global-definition)
;(define-keyglobal-map[(controlf7)]'cscope-find-global-definition-no-prompting)
;(define-keyglobal-map[(controlf8)]'cscope-pop-mark)
;(define-keyglobal-map[(controlf9)]'cscope-next-symbol)
;(define-keyglobal-map[(controlf10)]'cscope-next-file)
;(define-keyglobal-map[(controlf11)]'cscope-prev-symbol)
;(define-keyglobal-map[(controlf12)]'cscope-prev-file)
;(define-keyglobal-map[(metaf9)]'cscope-display-buffer)
;(defin-ekeyglobal-map[(metaf10)]'cscope-display-buffer-toggle)

;;(global-set-key [(meta return)] 'semantic-ia-complete-symbol-menu)

;;头文件
(if (string= window-system "w32")
    (progn
      (setq cc-search-directories
            (list "."                 
                  "d:/dev/include"
                  "d:/MinGW//include/"
                  "d:/MinGW/lib/gcc/mingw32//4.6.2/include/c++"
                  )))
  (progn
    (setq cc-search-directories
          (list
           "/usr/include/wine/windows"
           ))))

;;c
(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup")
  (c-toggle-auto-hungry-state 1);Backspace
  (c-toggle-auto-state 0)
  (c-set-offset 'member-init-intro '++)
  (c-set-offset 'innamespace 0)) ;;名字空间里2个缩进
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;auto indent 很奇怪，设置自动缩进需要用global-set-key
(global-set-key "\C-m" 'reindent-then-newline-and-indent)

            
;;C/C++语法检查
;;(global-cwarn-mode 1)

(add-to-list 'auto-mode-alist '("\\.dnc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpt\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hi\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ct\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.dox\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ce\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . c++-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cimpile
;; 编译定制
(setq my-compile-test-file "")
(setq my-compile-test-args "")
(setq compile-command "make -j 3  cd=true d=true")

(defun my-file-name (name)
  "获得文件名，返回结果不包括路径和扩展名"
  (setq fields (split-string name "/"))
  (setq name (elt fields (- (length fields) 1)))
  (setq len (length name))
  (setq i len)
  (setq ch "")
  (while (and (> i 0) (not (string= ch ".")))
    (progn
      (setq ch (substring name (- i 1) i))
      (setq i (- i 1))))
  (setq name (substring name 0 i)))


(defun my-file-extension (name)
  "获取文件扩展名，如果文件没有扩展名返回空字符串"
  (setq len (length name))
  (setq i len)
  (setq ch "")
  (while (and (> i 0) (not (string= ch ".")))
    (progn
      (setq ch (substring name (- i 1) i))
      (setq i (- i 1))))
  (if (> i 0)
      (setq name (substring name (+ i 1)))
    (setq name "")))


(defun my-onekey-compile ()
  "先保存所有文件，然后编译程序，不包括测试程序"
  (interactive)
  (save-some-buffers t)
  (compile compile-command))

(defun my-onekey-compile-test()
  "先保存所有文件，然后编译程序，包括当前的测试程序"
  (interactive)
  (save-some-buffers t)
  (setq temp compile-command)
  (setq command compile-command)
  (setq extension (my-file-extension buffer-file-name))
  (setq test-name nil)
  (setq type nil)

  (if (or (string= extension "ct") (string= extension "ce"))
      (setq my-compile-test-file buffer-file-name))
  (if (not (string= my-compile-test-file ""))
      (setq extension (file-name-extension my-compile-test-file)))

  ;;如果是.ct或者.ce文件，修改测试名字
  (cond
   ((string= extension "ct")   (setq type " t="))
   ((string= extension "ce")   (setq type " e=")))

  (if (string= my-compile-test-file "")
      (setq command compile-command)
    (progn
      (setq test-name (my-file-name my-compile-test-file))
      (setq command (concat compile-command type test-name))))
  
  (compile command)
  (setq compile-command temp))

(defun my-compile-clean ()
  "在编译命令之后加上clean,清除完了再恢复原来的编译命令"
  (interactive)
  (save-some-buffers t)
  (setq temp compile-command)
  (compile (concat compile-command " clean"))
  (setq compile-command temp))

(defun my-compile-get-param(name)
  "获得编译命令里的参数值"
  (let ((fields)(ret))
    (setq fields (split-string compile-command " "))
    (while fields
      (setq param (car fields))
      (setq pair (split-string param "="))
      (setq key (car pair))

      (if (and (eq (length pair) 2) (string= key name))
          (progn
            (setq val (cdr pair))
            (setq ret (car val))
            (setq fields nil))
        (setq fields (cdr fields)))
      )
    (if (and (string= window-system "w32") (string= name "p"))
        (setq ret "msw")
      (setq ret ret))))

(defun my-compile-test-prefix()
  "获得工程的测试目录，这个目录根据编译参数产生"
  (let ((p)(ret))
    (setq p (my-compile-get-param "p"))
    (if (not p)
        (setq p "linux"))
    (setq d (my-compile-get-param "d"))
    (if (and d (string= d "true"))
        (setq ret (concat (dnc-project-name) "-d." p))
      (setq ret (concat  (dnc-project-name) "." p)))
    ))

(defun my-compile-run-command()
  "获得测试程序的路径和名称，使用这个名称可以直接运行"
  (let ((p)(ret)(dir-spliter))
    (setq p (my-compile-get-param "p"))
    (if (string= window-system "w32")
        (setq dir-spliter "\\")
      (setq dir-spliter "/"))
    
    (if (string= "ct" (file-name-extension my-compile-test-file))
        (setq ret (concat ".."dir-spliter"test"dir-spliter (my-compile-test-prefix) "."
                          (my-file-name my-compile-test-file) ".ct"))
      (setq ret (concat ".."dir-spliter"bin"dir-spliter (my-file-name my-compile-test-file))))
    
    (if (string= "msw" p)
        (setq ret (concat ret ".exe")))
    
    (setq ret ret)
    ))


(defun my-compile-run ()
  "编译并运行编译好的程序"
  (interactive)
  (save-some-buffers t)
  (setq temp compile-command)
  (setq extension (my-file-extension buffer-file-name))
  (setq test-name nil)
  (setq type nil)

  (if (or (string= extension "ct") (string= extension "ce"))
      (setq my-compile-test-file buffer-file-name))
  (if (not (string= my-compile-test-file ""))
      (setq extension (file-name-extension my-compile-test-file)))
  
  ;;如果是.ct或者.ce文件，修改测试名字
  (cond
   ((string= extension "ct") (setq type " t="))
   ((string= extension "ce") (setq type " e=")))
  
  (if (string= my-compile-test-file "")
      (setq command compile-command)
    (progn
      (setq test-name (my-file-name my-compile-test-file))
      (setq command (concat compile-command type test-name))
      (setq command (concat command " && " (my-compile-run-command)))
      (setq command (concat command " " my-compile-test-args))))
  (compile command)
  (setq compile-command temp))

(setq my-compile-run-any-command "gcc")
(defun my-compile-run-any ()
  "编译任意的单个文件并运行编译好的程序"
  (interactive)
  (save-some-buffers t)
  (setq temp compile-command)
  (setq test-name nil)
  (setq type nil)
  (setq extension (file-name-extension buffer-file-name))
  (setq run-name (my-file-name buffer-file-name))
  (setq run-file (concat run-name "." extension))
  
  (setq command (concat my-compile-run-any-command " -o " run-name " " run-file))
  (setq command (concat command " && ./" run-name))
  (setq command (concat command " " my-compile-test-args))
  
  (compile command)
  (setq compile-command temp))

(defun my-compile-gccsense ()
  "使用gccsense编译所有文件，然后使得成员提示会起作用"
  (interactive)
  (save-some-buffers t)
  (setq temp compile-command)
  (compile "make gccsense")
  (setq compile-command temp))

(defun my-modify-compile-run-any-command(command)
  "修改my-compile-run-any命令所使用的编译命令"
  (interactive
   (list (read-from-minibuffer "Modify compile run any command: "
                               (eval my-compile-run-any-command) nil nil))
   (list (eval my-compile-run-any-command)))
  (setq my-compile-run-any-command command))

(defun my-compile-test-all()
  "编译所有测试程序并且运行它们"
  (interactive)
  (save-some-buffers t)
  (setq temp compile-command)
  (compile (concat compile-command " args=\"" my-compile-test-args "\" test"))
  (setq compile-command temp))

(defun my-compile-exe-all()
  "编译所有可执行程序"
  (interactive)
  (save-some-buffers t)
  (setq temp compile-command)
  (compile (concat compile-command " exe"))
  (setq compile-command temp))


(defun my-compile-modify-test-args(args)
  "修改测试程序的参数"
  (interactive
   (list (read-from-minibuffer "Modify test arguments: "
                               (eval my-compile-test-args) nil nil))
   (list (eval my-compile-test-args)))
  (setq my-compile-test-args args))

(defun my-modify-compile-command(command)
  "修改编译命令compile-command，并且执行编译"
  (interactive
   (list (read-from-minibuffer "Modify compile command: "
                               (eval compile-command) nil nil
                               '(compile-history . 1)))
   (list (eval compile-command)))
  (save-some-buffers t)
  (compile command))

(defun my-compile-modify-test (command)
  "修改测试单元my-compile-test-file，并且执行编译和程序"
  (interactive
   (list (read-from-minibuffer "Modify test unit: "
                               (eval my-compile-test-file) nil nil))
   (list (eval my-compile-test-file)))
  (setq my-compile-test-file command)
  (my-compile-run))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; debug
;;调试定制
(defun my-gdb-get-file ()
  "获得正在调试的可执行文件名"
  (setq file (buffer-name gud-comint-buffer))
  (setq len (length file))
  (setq file (substring file 5 (- len  1))))

(defun my-gdb-onekey-debug (command)
  "一键调试"
  (let ((old-buffer)(window))
    (interactive)
    (setq old-buffer (window-buffer))
    (setq window (selected-window))
    (gdb (concat "gdb --annotate=3 -windows" command))
    (set-window-buffer (selected-window) old-buffer)
    (other-window 1)
    (set-window-buffer (selected-window) gud-comint-buffer)
    (select-window window)))

(defun my-gdb-ptype()
  "打印光标所在处的标识符的类型"
  (interactive)
  (setq symbol (sbw-get-symbol-at-cursor))
  (if symbol
      (gud-call (concat "ptype " symbol))))

(defun my-gdb-ptype-dcptr()
  "打印光标所在处的标识符的类型"
  (interactive)
  (setq symbol (sbw-get-symbol-at-cursor))
  (if symbol
      (gud-call (concat "ptype " symbol ".m_p"))))

(defun my-gdb-print-dcptr()
  "打印光标所在处的智能指针的对象"
  (interactive)
  (setq symbol (sbw-get-symbol-at-cursor))
  (if symbol
      (gud-call (concat "print " symbol ".m_p"))))

(defun my-gdb-pstar-dcptr()
  "打印光标所在处的智能指针的对象"
  (interactive)
  (setq symbol (sbw-get-symbol-at-cursor))
  (if symbol
      (gud-call (concat "print *" symbol ".m_p"))))

(setq my-gdb-source-window nil)

(defun my-gdb-switch-window()
  "在源代码窗口和调试窗口之间进行切换"
  (interactive)
  (if (eq (window-buffer) gud-comint-buffer)
      (select-window my-gdb-source-window)
    (progn 
      (setq my-gdb-source-window (selected-window))
      (setq gdb-window (get-buffer-window gud-comint-buffer))
      (if gdb-window
          (select-window gdb-window)
        (progn
          (other-window 1)
          (set-window-buffer (selected-window) gud-comint-buffer))))))

(defun my-gdb-frame-buffer(name)
  "打开指定调试frame窗口,name 可以是任何gdb-buffer-rules-assoc变量列出的名字"
  (setq window (selected-window))
  (other-window 1)
  (if (eq (window-buffer) gud-comint-buffer) 
      (other-window 1))
  (if (eq (gdb-get-buffer name) nil)
      (set-window-buffer (selected-window) (gdb-get-buffer-create name)))
  (if (eq (get-buffer-window (gdb-get-buffer name)) nil)
      (set-window-buffer (selected-window) (gdb-get-buffer name)))
  (select-window window))


(defun my-gdb-assembler-buffer()
  "在另外一个窗口打开assembler frame"
  (interactive)
  (my-gdb-frame-buffer 'gdb-assembler-buffer))
(defun my-gdb-locals-buffer()
  "在另外一个窗口打开locals frame"
  (interactive)
  (my-gdb-frame-buffer 'gdb-locals-buffer))
(defun my-gdb-memory-buffer()
  "在另外一个窗口打开memory frame"
  (interactive)
  (my-gdb-frame-buffer 'gdb-memory-buffer))
(defun my-gdb-registers-buffer()
  "在另外一个窗口打开registers frame"
  (interactive)
  (my-gdb-frame-buffer 'gdb-registers-buffer))
(defun my-gdb-threads-buffer()
  "在另外一个窗口打开threads frame"
  (interactive)
  (my-gdb-frame-buffer 'gdb-threads-buffer))
(defun my-gdb-stack-buffer()
  "在另外一个窗口打开stack frame"
  (interactive)
  (my-gdb-frame-buffer 'gdb-stack-buffer))
(defun my-gdb-breakpoints-buffer()
  "在另外一个窗口打开breakpoints frame"
  (interactive)
  (my-gdb-frame-buffer 'gdb-breakpoints-buffer))
(defun my-gdb-inferior-io()
  "在另外一个窗口打开inferior frame"
  (interactive)
  (my-gdb-frame-buffer 'gdb-inferior-io))
(defun my-gdb-partial-output-buffer()
  "在另外一个窗口打开partial output frame"
  (interactive)
  (my-gdb-frame-buffer 'gdb-partial-output-buffer))

(defun my-gdb-print-object()
  "打开打印对象状态，打开后能通过C++的虚拟机制打印一个对象的最终类的信息"
  (interactive)
  (gud-call "set print object on"))


;;调试环境
(setq gud-tooltip-mode t)
(setq gdb-many-windows t)

(require 'gud)
(require 'gdb-ui)

;;gdb正在调试的文件
(setq my-gdb-file "")

(defun my-gdb-test-debug-or-go ()
  "调试测试文件。这个函数的行为是这样的:
   *. 如果当前buffer是一个.ct或者.ce文件，并且gdb没有启动，那么启动一个gdb，并且装载当前的测试文件
   *. 如果当前buffer不是一个.ct或者.ce文件，并且gdb没有启动，那么启动一个gdb，并且装载当前的测试文件
   *. 如果gdb已经启动，那么继续进测试或者开始运行测试
   *. 如果当前buffer是一个.ct或者.ce文件，那么这个函数会把my-compile-test-file变量改成当前buffer里的测试名称
"
  (interactive)
  (if (string= (my-file-extension buffer-file-name) "ct")
      (setq my-compile-test-file buffer-file-name))
  (if (string= my-compile-test-file "")
      (setq command "")
    (setq command (my-compile-run-command)))

  ;;判断是否有gdb在运行
  (setq has-gdb nil)
  (if (and gud-comint-buffer
           (buffer-name gud-comint-buffer)
           (get-buffer-process gud-comint-buffer)
           (with-current-buffer gud-comint-buffer (eq gud-minor-mode 'gdba)))
      (setq has-gdb "true"))

  (if has-gdb
      (progn 
        (if (eq (get-buffer-window gud-comint-buffer) nil)
            (progn
              (other-window 1)
              (set-window-buffer (selected-window) gud-comint-buffer)))
        
        (setq window (selected-window))
        (gud-call (if gdb-active-process "continue" "run") "")
        (select-window window))
    (progn 
      (setq my-gdb-source-window (selected-window))
      (my-gdb-onekey-debug command)
      (setq my-gdb-file command))))


(defun my-gdb-debug-or-go ()
  "If gdb isn't running; run gdb, else call gud-go."
  (interactive)
  (if (and gud-comint-buffer
           (buffer-name gud-comint-buffer)
           (get-buffer-process gud-comint-buffer)
           (with-current-buffer gud-comint-buffer (eq gud-minor-mode 'gdba)))
      (progn
        (setq window (selected-window))
        (gud-call (if gdb-active-process "continue" "run") "")
        (select-window window))
    (my-gdb-onekey-debug "")))

(defun my-gdb-break-remove ()
  "Set/clear breakpoin."
  (interactive)
  (save-excursion
    (if (eq (car (fringe-bitmaps-at-pos (point))) 'breakpoint)
        (gud-remove nil)
      (gud-break nil))))

(defun my-gdb-break-watch()
  "对光标当前的变量设置内存断点"
  (interactive)
  (setq symbol (sbw-get-symbol-at-cursor))
  (if symbol
      (gud-call (concat "watch " symbol))))
(defun my-gdb-break-rwatch()
  "对光标当前的变量设置内存断点"
  (interactive)
  (setq symbol (sbw-get-symbol-at-cursor))
  (if symbol
      (gud-call (concat "rwatch " symbol))))
(defun my-gdb-break-awatch()
  "对光标当前的变量设置内存断点"
  (interactive)
  (setq symbol (sbw-get-symbol-at-cursor))
  (if symbol
      (gud-call (concat "awatch " symbol))))


(defun my-gdb-kill ()
  "Kill gdb process."
  (interactive)
  (with-current-buffer gud-comint-buffer (comint-skip-input))
  (kill-process (get-buffer-process gud-comint-buffer)))
;;(setq gdb-many-windows t)

;;调试快捷键
;; (global-set-key [f5]     'my-gdb-test-debug-or-go)
;; (global-set-key [S-f5]   'my-gdb-kill)
;; (global-set-key [f6]     'gud-next)
;; (global-set-key [C-f6]   'gud-until)
;; (global-set-key [S-f6]   'gud-jump)
;; (global-set-key [f7]     'gud-step)
;; (global-set-key [f8]     'gud-finish)
;; (global-set-key [f9]     'my-gdb-break-remove)
;; (global-set-key "\C-cmw" 'my-gdb-break-watch)
;; (global-set-key "\C-cmr" 'my-gdb-break-rwatch)
;; (global-set-key "\C-cma" 'my-gdb-break-awatch)

(global-set-key [(control =)]      'gud-print)
(global-set-key [(control +)]      'gud-pstar)
(global-set-key [(meta =)]         'my-gdb-print-dcptr)
(global-set-key [(meta +)]         'my-gdb-pstar-dcptr)
(global-set-key [(control meta +)] 'my-gdb-ptype)

(global-set-key [(meta \,)] 'my-gdb-switch-window)

(global-set-key "\C-xga"  'my-gdb-assembler-buffer)
(global-set-key "\C-xgl"  'my-gdb-locals-buffer)
(global-set-key "\C-xgm"  'my-gdb-memory-buffer)
(global-set-key "\C-xgr"  'my-gdb-registers-buffer)
(global-set-key "\C-xgt"  'my-gdb-threads-buffer)
(global-set-key "\C-xgs"  'my-gdb-stack-buffer)
(global-set-key "\C-xgb"  'my-gdb-breakpoints-buffer)
(global-set-key "\C-xgi"  'my-gdb-inferior-io)
(global-set-key "\C-xgp"  'my-gdb-partial-output-buffer)
(global-set-key "\C-xgo"  'my-gdb-print-object)
(global-set-key "\C-xgy"  'my-gdb-ptype)

(global-set-key [(control meta shift mouse-1)]  'my-gdb-ptype)
(global-set-key "\C-xgk"  'my-gdb-ptype-dcptr)
(global-set-key [(meta shift mouse-3)]  'my-gdb-ptype-dcptr)
(global-set-key "\C-xgw"  'gud-print)
(global-set-key [(control shift mouse-1)]  'gud-print)
(global-set-key "\C-xge"  'gud-pstar)
(global-set-key [(control shift mouse-3)]  'gud-pstar)
(global-set-key "\C-xgd"  'my-gdb-print-dcptr)
(global-set-key [(control meta mouse-1)]  'my-gdb-print-dcptr)
(global-set-key "\C-xgh"  'my-gdb-pstar-dcptr)
(global-set-key [(control meta mouse-3)]  'my-gdb-pstar-dcptr)

(global-set-key "\C-cbg"            'sbw-symbol-goto-on-cursor)
(global-set-key "\C-cbt"            'sbw-symbol-type-goto-on-cursor)
(global-set-key "\C-cbc"            'sbw-symbol-class-goto-on-cursor)
(global-set-key "\C-cbd"            'sbw-find-function-define-or-declare)
(global-set-key "\C-cbp"            'sbw-print-point)
(global-set-key "\C-cbi"            'sbw-insert-function-define)
(global-set-key "\C-cba"            'sbw-beginning-of-function)
(global-set-key "\C-cbs"            'sbw-get-syntactic-list)
(global-set-key "\C-cbq"            'sbw-get-dir-of-file)


;; (global-set-key [(control \.)]     'my-insert-pointer-access)
;; (global-set-key "\C-cr"             'my-revert-buffer)
;; (global-set-key "\C-c\C-r"          'my-revert-buffer-all)


(message "  ")
(message "*************************************")
(message "        djzhang-mingw-gcc-settings") 
(message "*************************************")
(message "  ")



(provide 'djzhang-mingw-gcc-settinigs)

