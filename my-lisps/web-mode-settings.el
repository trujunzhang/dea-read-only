;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-12-18 13:40:39 Tuesday by djzhang>

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



;; web-mode.el

;; About

;; web-mode.el is an autonomous emacs major-mode for editing web templates (HTML documents embedding CSS / JavaScript / Code blocks).
;; web-mode.el is will never be a full featured PHP or JS mode. (We don’t encourage multi-lines blocks of code in templates!).

;; Native Features

;; smart indentation (according to the context : HTML, code, JavaScript or CSS)
;; compatibility with many template engines : PHP / JSP / Twig / Jinja2 / ASPX / ERB / FreeMarker
;; block navigation C-c C-n between opening and closing HTML tag or between PHP/JSP controls <?php if (): ?> … <?php endif; ?>, <c:if> … </c:if>, {% for %} … {% endfor %}, etc.
;; code folding C-c C-f for HTML and control blocks
;; HTML tag autoclosing (after </)
;; syntax highlighting (according to the type of block)
;; snippet insertion C-c C-i (auto indented, aware of text selection)
;; auto-completes (ex. ?> after <?php)
;; comment / uncomment C-c C-; according to the type of block
;; clever selection and expansion C-c C-m
;; css colorization



;; Install

;; First drop the file web-mode.el in a directory defined in your load-path.
;; Then, add in your .emacs
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; If your template extension is tpl, "\\.phtml" becomes "\\.tpl"

;; Using web-mode for editing plain HTML files can be done this way
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; Customisation

;; The following customisations (except the last one) can be put in a hook this way
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'web-mode-hook)
;; Indentation
;; HTML offset indentation
(setq web-mode-markup-indent-offset 2)
;; CSS offset indentation
(setq web-mode-css-indent-offset 2)
;; Script offset indentation (for JavaScript, Java, PHP, etc.)
(setq web-mode-code-indent-offset 2)
;; Syntax Highlighting
;; Change face color
(set-face-attribute 'web-mode-css-rule-face nil :foreground "Pink3")
;; Available faces:
;; web-mode-doctype-face, web-mode-html-tag-face, web-mode-html-attr-name-face, web-mode-html-attr-value-face
;; web-mode-css-rule-face, web-mode-css-prop-face, web-mode-css-pseudo-class-face, web-mode-css-at-rule-face
;; web-mode-preprocessor-face, web-mode-string-face, web-mode-comment-face
;; web-mode-variable-name-face, web-mode-function-name-face, web-mode-constant-face, web-mode-type-face, web-mode-keyword-face
;; web-mode-folded-face
;; Shortcuts
;; Change the shortcut for element navigation
;; (define-key web-mode-map (kbd "C-n") 'web-mode-match-tag)
;; Snippets
;; Add a snippet
(add-to-list 'web-mode-snippets '("mydiv" "<div>" "</div>"))
;; name, beg, end (if region exists, the content is inserted between beg and end)
;; Disable features
;; Autocomplete
(setq web-mode-disable-autocompletion t)
;; CSS colorization
(setq web-mode-disable-css-colorization t)
;; Keywords
;; Add PHP constants
(setq web-mode-extra-php-constants '("constant1" "constant2"))
;; Also available : web-mode-extra-php-keywords, web-mode-extra-js-keywords, web-mode-extra-jsp-keywords, web-mode-extra-asp-keywords 
;; (Note: do not put this line in the hook)
;; Shortcuts

;; C-c C-; : comment / uncomment line(s)
;; C-c C-a : indent all buffer
;; C-c C-d : delete current HTML element
;; C-c C-e : select inner HTML element
;; C-c C-f : toggle folding on a block
;; C-c C-i : insert snippet
;; C-c C-j : duplicate current HTML element
;; C-c C-m : mark and expand
;; C-c C-n : jump to opening/closing tag
;; C-c C-p : jump to parent HTML element
;; C-c C-s : select current HTML element
;; FAQ

;; Autoremove final white spaces on save
;; Add those lines in the web-mode hook
(add-hook 'local-write-file-hooks
            (lambda ()
               (delete-trailing-whitespace)
               nil))
;; Make this mode faster
;; M-x byte-compile-file
;; Platforms/Compatibility
;; Tested on GNU/Linux and OSX
;; Tested with versions 24 and 23.
;; For 23, add this line in your .emacs
;; (unless (fboundp 'prog-mode) (defalias 'prog-mode 'fundamental-mode))
;; I want to use both php-mode and web-mode
;; You can do it this way
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; The matching is done on the path. You can alo configure like this if your templates are stored in a subdirectory called views, html or templates.
;; (add-to-list 'auto-mode-alist '("/\\(views\\|html\\|templates\\)/.*\\.php\\'" . web-mode))
;; How can I turn auto indentation on ?
;; Put this line in the web-mode-hook
;; (local-set-key (kbd "RET") 'newline-and-indent)
;; You can also use M-x electric-indent-mode
;; Can I contribute ?
;; Of course, you can send bug reports/fixes, or help me empty this amazon wishlist.
;; Syntax coloring does not work
;; Do not enable rainbow-mode with web-mode.


(provide 'web-mode-settings)
