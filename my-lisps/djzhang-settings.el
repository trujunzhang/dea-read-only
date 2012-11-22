

;; 用emacs写csharp程序--fans1的Blog

;;http://m.baidu.com/ssid=0/from=844b/bd_page_type=1/uid=wiaui_1327752820_5573/pu=sz%40320_1004%2Cusm%400/w=0_10_emacs编辑csharp/t=wap/tc?ref=www_colorful&lid=739010104&tj=www_normal_5_0_10&p=82759a40d5d55ffb0be290124955&order=5&vit=osres&src=http%3A%2F%2Ffans1.bokee.com%2F6376831.html

;;emacs写好cs文件后，需要编译，如果没有配好环境变量，直接用M-x compile是不行的。修改系统的环境变量是一个解决方法。或者在emacs中设置环境变量。设置如下：


;(setenv "Path" (concat "C:\\Program Files\\Microsoft.NET\\SDK\\v2.0\\Bin;C:\\WINDOWS\\Microsoft.NET\\Framework\\v2.0.50727;C:\\Program Files\\Microsoft Visual Studio 8\\VC\\bin;C:\\Program Files\\Microsoft Visual Studio 8\\Common7\\IDE;C:\\Program Files\\Microsoft Visual Studio 8\\VC\\vcpackages;" (getenv "LIB")))

(setenv "LIB" (concat "C:\\Program Files\\Microsoft Visual Studio 8\\VC\\lib;C:\\Program Files\\Microsoft.NET\\SDK\\v2.0\\Lib;" (getenv "LIB")))
(setenv "INCLUDE" (concat "C:\\Program Files\\Microsoft Visual Studio 8\\VC\\include;C:\\Program Files\\Microsoft.NET\\SDK\\v2.0\\include;" (getenv "LIB")))
(setenv "NetSamplePath" "C:\\Program Files\\Microsoft.NET\\SDK\\v2.0")
(setenv "VCBUILD" "DEFAULT_CFG=Debug^|Win32")
(setenv "VCBUILD" "DEFAULT_OPTIONS=/useenv")

;;下一个使用问题是compile无法自动识别csc输出出错信息。需要添加如下到.emacs中：

;;(setq compilation-error-regexp-alist 
;;      (append  
;;       (cons '("\\(.*\\)(\\([0-9]+\\),\\([0-9]+\\)): \\(error\\|warning\\) CS[0-9]+:" 1 2 3) ()) 
;;       compilation-error-regexp-alist 
;;       ) 
;;)

;;基本编译cs文件就ok啦。


;; 不要生成备份文档
(setq-default make-backup-files nil)

;;条款2：不用Alt来调用M-x
;;将下面的lisp表达式加到你的.emacs文件中，就可以启用Ctrl-x Ctrl-m了：
(global-set-key (kbd "C-c C-n") 'execute-extended-command)

;;设置不重启更新.emacs配置
;; (global-set-key (kbd "C-c C-v") 'eval-buffer)
;; (global-set-key [(f11)] 'eval-buffer)


;; 变化后，更新文件
;; (global-set-key "\C-c\C-u" 'revert-buffer-no-confirm)

;; espresso for jquery
;; http://www.nongnu.org/espresso/
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
      (add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
      (add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))


;; 改变emacs启动窗口大小的两种方法
(setq default-frame-alist 
'((left . 122)
  (top . 52)
  (height . 25)
  (width . 100)
  )
) 

;; 设置显示yasnippet的insert对话框的快捷键
;; (global-set-key "\C-i" 'yas/insert-snippet)

(global-set-key [(f5)] 'yas/insert-snippet)

;; (global-set-key [(f7)] 'shell-)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buffer 操作
(defun my-revert-buffer()
  "刷新buffer，当文件在外部被修改时有用"
  (interactive)
  (revert-buffer nil t))

(defun my-revert-buffer-all()
  "重新装载所有buffer中的文件"
  (interactive)
  (let ((buffers (buffer-list))
        (old-buffer (current-buffer)
                    ))
    (while buffers
      (setq buffer (car buffers))
      (set-buffer buffer)
      (if (buffer-file-name)
          (revert-buffer nil t))
      (pop buffers))
    (set-buffer old-buffer)
    ))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window
;;为支持高清显示器
;;水平拆分成3个窗口
(defun split-window-horizontally3()
  "把窗口拆分成水平的3个，适合高清显示器"
  (interactive)
  (setq width (+ (/ (window-width) 3) 1))
  (split-window nil (* width 2) t)
  (split-window nil width t)
  )

(defun split-window5-and-fullscreen()
  "把窗口拆分成水平的5个，并且全屏显示emacs"
  (interactive)
  (my-fullscreen)
  (split-window5))

;;拆分成6个窗口
(defun split-window6()
  "把窗口拆分成6个，适合高清显示器"
  (interactive)
  (setq width (+ (/ (window-width) 3) 1))
  (setq height (/ (window-height) 2))
  
  (setq w (split-window nil (* width 2) t))
  (split-window w height)
  
  (setq w (split-window nil width t))
  (split-window w height)

  (split-window nil height)
  )

(defun split-window5()
  "把窗口拆分成5个，中间一个很高的窗口，它的两边一边两个，适合高清显示器"
  (interactive)
  (setq width (+ (/ (window-width) 3) 1))
  (setq height (/ (window-height) 2))
  
  (setq w (split-window nil (* width 2) t))
  (split-window w height)
  
  (setq w (split-window nil width t))

  (split-window nil height)
  )

;;窗口,文件切换
(defun my-previous-window()
  (interactive)
  (select-window (previous-window)))
(defun my-next-window()
  (interactive)
  (select-window (next-window)))

(defun onekey-kill-buffer()
  (interactive)
  (kill-buffer (current-buffer)))


(message "..................................................< djzhang-settings >.................")


(provide 'djzhang-settings)



