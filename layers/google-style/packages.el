;;; packages.el --- google-style layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: sergey.matveev <sergeyma@nnsitgsc004>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `google-style-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `google-style/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `google-style/pre-init-PACKAGE' and/or
;;   `google-style/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst google-style-packages
  '(
    (google-c-style :location local)
    )
  "The list of Lisp packages required by the google-style layer.")

(defun google-style/init-google-c-style ()
  (use-package google-c-style
    :config
    (progn
      (add-hook 'c-mode-common-hook 'google-set-c-style)
      (add-hook 'c-mode-common-hook 'google-make-newline-indent))))

;;; packages.el ends here
