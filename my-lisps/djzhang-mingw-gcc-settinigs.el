;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-09-25 10:50:47 Tuesday by djzhang>

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
;;;; 各窗口间切换
 ;; (global-set-key [M-left] 'windmove-left)
 ;; (global-set-key [M-right] 'windmove-right)
 ;; (global-set-key [M-up] 'windmove-up)
 ;; (global-set-key [M-down] 'windmove-down)

;;;; 隐藏和显示ecb窗口
(define-key global-map [(control f1)] 'ecb-activate)
(define-key global-map [(control f2)] 'ecb-deactivate)


(provide 'djzhang-mingw-gcc-settinigs)

