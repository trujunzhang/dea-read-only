
;; Created Mon, 24 May 2010  17:21
;; Updated Fri, 13 May 2011  13:02

;; x-URL: http://code.google.com/p/csharpmode/

;; This is the readme for csharp-mode.

;; =======================================================

;; You can use csharp-mode just as it is.  To do so,

 ;; put this in your .emacs:

   (autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)

;; or:

;   (require 'csharp-mode)


;; AND:

   (setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))


   (setq auto-mode-alist
      (append '(("\\.aspx$" . html-mode)) auto-mode-alist))	  
	  
   (defun my-csharp-mode-fn ()
      "function that runs when csharp-mode is initialized for a buffer."
;;      ...insert your code here...
;;      ...most commonly, your custom key bindings ...
   )
   (add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)


;;=======================================================

       (eval-after-load "csharp-completion"
        '(progn
           (setq cscomp-assembly-search-paths
             (list "c:\\.net3.5ra"    ;; <<- locations of reference assemblies
                   "c:\\.net3.0ra"    ;; <<-
                     ...              ;; <<- other assembly directories you use
                   "c:\\.net2.0"      ;; <<- location of .NET Framework assemblies
                   "c:\\.net3.5"      ;; <<- ditto
           ))))



    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; C# code completion (requires CEDET semantic)

    ;;d:/TC_UP/PLUGINS/SoftwareFiles/gnuemacs/dea-read-only/lisps/cedet-1.0/
    ;;

;;    (setq load-path
;;          (append '("d:/TC_UP/PLUGINS/SoftwareFiles/gnuemacs/dea-read-only/lisps/cedet-1.0/semantic"
;;                    "d:/TC_UP/PLUGINS/SoftwareFiles/gnuemacs/dea-read-only/lisps/cedet-1.0/semantic/bovine"
;;                    "d:/TC_UP/PLUGINS/SoftwareFiles/gnuemacs/dea-read-only/lisps/cedet-1.0/common"
;;                    "d:/TC_UP/PLUGINS/SoftwareFiles/gnuemacs/dea-read-only/lisps/cedet-1.0//eieio"
;                    "d:/TC_UP/PLUGINS/SoftwareFiles/gnuemacs/dea-read-only/lisps/cedet-1.0//contrib"
;                    )  load-path ))

;;    (load "semantic")
;;    (load "semantic-load")
;;    (load "wisent-csharp")

;;    (require 'csharp-completion)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;In your csharp-mode-hook, bind a key to the cscomp completion trigger.
;;Like this:

         ;; C# code completion
         (local-set-key "\M-\\"   'cscomp-complete-at-point)
         (local-set-key "\M-\."   'cscomp-complete-at-point-menu)

;;=======================================================

;; The c# code completion is experimental. It depends on
;; ICSharpCode.NRefactory.dll,  as well as powershell.el and
;; a few other .el modules.

;; Use it and let me know how it goes for you.


;; =======================================================


(require 'flymake-for-csharp)

;; 高亮显示nant里的build文件
;; (require 'ant)
    (setq auto-mode-alist
       (append '(("\\.build$" . xml-mode)) auto-mode-alist))

;;;###autoload
(defun smart-nant ()
  "doc."
  (interactive)
    (let* ((file (buffer-file-name)) base-name default-command (input "")))
    ;; (message default-directory)
    ;; d:\TC_UP\PLUGINS\SoftwareFiles\gnuemacs\dea-read-only\lisps\
    (setq nant-help-path (format "%s%s"  my-emacs-lisps-path "smart-compile/csharp/nant_helper.py"))
    (setq nant-help-paras (format "\"%s;%s\"" default-directory "build"))
    (setq nant-by-python (format "python %s %s" nant-help-path nant-help-paras))
     (shell-command nant-by-python)
    ;; (message nant-by-python)
    ;; (message nant-help-paras)
    ;; (message my-emacs-lisps-path)

  )



(defun smart-nant111 (command)
  "以命令COMMAND运行当前源程序对应的程序"
  (interactive
   (let* ((file (buffer-file-name)) base-name default-command (input ""))
     (if (not file)
         (error "此buffer不与任何文件关联")
       (setq base-name (file-name-nondirectory file))
       (setq default-command 
             (let ((extension (file-name-extension file)))
               (if (not extension)
                   (setq extension ""))
               (cond
                ((or (equal extension "cpp") (equal (downcase extension) "c"))
                 (format "./%s" (file-name-sans-extension base-name)))
                ((equal extension "py")
                 (format "python %s" base-name))
                ((equal extension "java")
                 (format "java %s" (file-name-sans-extension base-name)))
                ((or (equal extension "sh") (equal major-mode 'sh-mode))
                 (format "sh %s" base-name))
                );;end cond
               );;end let
             );;end default-command
       (setq input "wanghao")
        (list input)
       );; end if
     );; end let*
   )
  )


;;;###autoload
(defun smart-nant123 (command)
  "以命令COMMAND运行当前源程序对应的程序"
  (interactive
   (let* ((file (buffer-file-name)) base-name default-command (input ""))
     (if (not file)
         (error "此buffer不与任何文件关联")
       (setq base-name (file-name-nondirectory file))
       (setq default-command 
             (let ((extension (file-name-extension file)))
               (if (not extension)
                   (setq extension ""))
               (cond
                ((or (equal extension "cpp") (equal (downcase extension) "c"))
                 (format "./%s" (file-name-sans-extension base-name)))
                ((equal extension "py")
                 (format "python %s" base-name))
                ((equal extension "java")
                 (format "java %s" (file-name-sans-extension base-name)))
                ((or (equal extension "sh") (equal major-mode 'sh-mode))
                 (format "sh %s" base-name))
                );;end cond
               );;end let
             );;end default-command
       (while (string= input "")
         (setq input (read-from-minibuffer "Command to run: " default-command nil nil 'shell-command-history default-command)));;end while
       (list input)
       );; end if
     );; end let*
   )
  (let ((buffer "*Shell Command Output*"))
    (shell-command command buffer)
    (sleep-for 1)
    (end-of-buffer-other-window buffer)))


 (global-set-key [(f12)] 'smart-nant)


(message "csharp-settings.el.....................")

(provide 'csharp-settings)











