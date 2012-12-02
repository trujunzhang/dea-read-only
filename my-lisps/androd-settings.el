;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-12-02 07:09:44 Sunday by djzhang>

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

;; url: {https://code.google.com/p/android-emacs-toolkit/}

;;  For Windows users
;; .1 Install emacs.
;; .2 Install android-sdk-windows.
;; .3 Install android-ndk-windows.
;; .4 Install ant.
;; .5 Add ant bin folder to PATH.
(setenv "PATH" (concat "D:/ProgramFiles/Android/ant/bin/;" (getenv "PATH")))
 
;; .6 Install cygwin.
;; .7 Set up cygwin for emacs.
;; (setq cygwin-binary-directory "d:/cygwin/bin/")
;; Do not use setup-cygwin.el currently.
;; (require 'setup-cygwin)
(when (eq system-type 'windows-nt)
  (setenv "PATH" (concat "D:/cygwin/bin;" (getenv "PATH")))
  (setq exec-path (cons "D:/cygwin/bin/" exec-path))
  (require 'cygwin-mount)
  (cygwin-mount-activate)
  (add-hook 'comint-output-filter-functions
            'shell-strip-ctrl-m nil t)
  (add-hook 'comint-output-filter-functions
            'comint-watch-for-password-prompt nil t)
  (setq explicit-shell-file-name "bash.exe")
  ;; For subprocesses invoked via the shell
  ;; (e.g., "shell -c command")
  (setq shell-file-name explicit-shell-file-name)
  )

;; .8 Set some defvar.
;; Do not use '\' instead '/'
(if (eq system-type 'windows-nt)
    (progn (setq android-ndk-root-path "d:/ProgramFiles/Android/android-ndk-r8c")
           (setq android-sdk-root-path "d:/ProgramFiles/Android/adt-bundle-windows-x86_64/sdk"))
  ;; Ubuntu do not understanding '~' instead of 'home'
  (progn (setq android-ndk-root-path "/home/share/program/android-ndk-r7-linux")
         (setq android-sdk-root-path "/home/share/program/android-sdk-linux")))
(setq android-default-package "com.zxy")

  
;; .9 Add android-emacs-toolkit to emacs.
;; Do not add to list because of loading it automately.
;; (add-to-list 'load-path "c:/android-emacs-toolkit")
(require 'androidmk-mode)
(add-hook 'androidmk-mode-hook
          (lambda ()
            (progn (local-set-key [M-f5] 'androidndk-build)
                   (local-set-key [M-S-f5] 'androidndk-rebuild)
                   (local-set-key [C-f5] 'androidsdk-build)
                   (local-set-key [C-S-f5] 'androidsdk-rebuild)
                     )))
 
;; RUNNING EXAMPLES

;;;###autoload
(defun  run-android-projects()
  ""
  (interactive)
  (w32-shell-execute "open"  "e:/oksvn/Android/wanghao/wanghaoandroid/push-vbox.exe")
  )


(global-set-key [(f11)] 'run-android-projects)


(message "  ")
(message "*************************************")
(message "        android-settings")
(message "*************************************")
(message "  ")


(provide 'androd-settings)
