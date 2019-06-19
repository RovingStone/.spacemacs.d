;;; packages.el --- org-config layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2019 Sylvain Benner & Contributors
;;
;; Author: Sergei Matveev <matveev.d3v@yandex.ru>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst org-config-packages
  '((ob-async)
    (org-mouse :location built-in)
    (org-pdfview))
  "The list of Lisp packages required by the org-config layer.")

(defun org-config/init-ob-async ()
  (use-package ob-async
    :after org))

(defun org-config/init-org-mouse ()
  (use-package org-mouse
    :after org
    :custom (org-mouse-features '(activate-checkboxes))))

(defun org-config/init-org-pdfview ()
  (use-package org-pdfview
    :after org))

;;; packages.el ends here
