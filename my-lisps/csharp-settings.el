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


(provide 'csharp-settings)











