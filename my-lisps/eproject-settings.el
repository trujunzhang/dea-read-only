;; -*- Emacs-Lisp -*-

;; Time-stamp: <2012-12-02 21:51:39 Sunday by djzhang>

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


; load eproject
;; (load-file "~/.emacs.d/eproject/eproject.el")
(require 'eproject)

; Disable automatic addition/removal of files from projects. Optional.
(setq prj-autotracking nil)

; anything + eproject integration
(require 'anything-eproject)


(provide 'eproject-settings)
