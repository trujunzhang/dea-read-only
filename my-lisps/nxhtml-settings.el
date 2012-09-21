

(load "d:/TC_UP/PLUGINS/SoftwareFiles/gnuemacs/dea-read-only/lisps/nxhtml/autostart.el")

(add-to-list 'auto-mode-alist
             '("\\.rhtml$" . kid-rhtml-mode))
;; only special background in submode
(setq mumamo-chunk-coloring 'submode-colored)
(setq nxhtml-skip-welcome t)
 
;; do not turn on rng-validate-mode automatically, I don't like
;; the anoying red underlines
(setq rng-nxml-auto-validate-flag nil)
 
;; force to load another css-mode, the css-mode in nxml package
;; seems failed to load under my Emacs 23
(let ((load-path (cons "~/emacs/extension/"
                       load-path)))
  (require 'css-mode))
 
(defun kid-rhtml-mode ()
  (nxhtml-mode)
  ;; I don't use cua-mode, but nxhtml always complains. So, OK, let's
  ;; define this dummy variable
  (make-local-variable 'cua-inhibit-cua-keys)
  (setq mumamo-current-chunk-family '("eRuby nXhtml Family" nxhtml-mode
                                      (mumamo-chunk-eruby
                                       mumamo-chunk-inlined-style
                                       mumamo-chunk-inlined-script
                                       mumamo-chunk-style=
                                       mumamo-chunk-onjs=)))
  (mumamo-mode)
  (rails-minor-mode t)
  (auto-fill-mode -1)
  (setq tab-width 2)
  (setq indent-tabs-mode nil))




(provide 'nxhtml-settings)

;;; dired-lis.el ends here
