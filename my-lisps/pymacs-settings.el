;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-09-22 10:31:16 Saturday by djzhang>


;; (require 'python-mode)


;;文件关联，自动将py后缀的文件和pyhton-mod关联
;; 首先安装python-mode
;; emacs有自带的python模式，但是大家一般都是用这个python-mode.el的拓展插件，功能方面要强大好用一些。下载：http://www.rwdev.eu/python/pycomplete/python-mode.el

;; 把下载的python-mode.el文件放到emacs的插件加载目录中，并在.emacs配置文件中加入如下配置信息：
;; 启动你的emacs，可以发现菜单上多了两个菜单，其中之一是：IM-Python, 而另一个是python。
;; IM-Python中全部是类和函数的定义，点击后可以直接到相关的定义处，而python菜单可以显示当前的语句块，当前的函数定义，当前的类定义等等
(load "python-mode.el")
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
;;自动加载，将 python-mode 和文件 python-mode.elc关联
(autoload 'python-mode "python-mode" "Python editing mode." t)
(global-font-lock-mode t)  ;语法加亮
(setq font-lock-maximum-decoration t)


;; 然后安装pymacs
;; 这个插件是用来连接emacs和python的，有了它就可以在emacs中调用python了。
;; 下载：http://pymacs.progiciels-bpi.ca/

;; 进入pymacs目录，执行如下命令：
;; 1) [python pppp -C ppppconfig.py Pymacs.py.in pppp.rst.in pymacs.el.in pymacs.rst.in contrib tests]
;; 2) [python setup.py install]

;; (autoload       'pymacs-apply       "pymacs")
;; (autoload       'pymacs-call        "pymacs") 
;; (autoload       'pymacs-eval        "pymacs"       nil   t) 
;; (autoload       'pymacs-exec        "pymacs"       nil   t) 
;; (autoload       'pymacs-load        "pymacs"       nil   t) 
;; (autoload       'pymacs-autoload    "pymacs") 
;;(eval-after-load     "pymacs" )
;;(add-to-list         'pymacs-load-path           YOUR-PYMACS-DIRECTORY")) 


(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)


;; 最后安装pycomplete
;; 这个插件就是用来实现对python代码进行自动补全功能的插件
;; 下载：http://www.rwdev.eu/python/pycomplete/pycomplete.el

;; 将pycomplete.el文件放到插件目录下，将pycomplete.py文件放到Python安装目录的/site-packages/下，我的系统中的路径是/usr/local/lib/python2.6/site-packages/，然后在.emacs文件中加入如下代码：
 (autoload 'python-mode "python-mode" "Python Mode." t)
 (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
 (add-to-list 'interpreter-mode-alist '("python" . python-mode))
 (require 'pycomplete)

;; 现在emacs就可以实现自动补全了，使用方法如下：

;; 输入datetime.时，按下C + i，emacs将生成所有可能项
;; 输入datetime.n时，按下C + i，emacs将自动生成datetime.now
;; 光标放到datetime上，按F1，将出现这个类的help信息

;; 其他一些快捷键用法可以具体参考pycomplete.el文件


(message "  ")
(message "=====================================================  ")
(message " Loading pymacs-settings")
(message "=====================================================  ")
(message "  ")

(provide 'pymacs-settings)

