;;; packages.el --- polymode layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sergey.matveev <sergeyma@nnsitgsc004>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst polymode-packages
  '(polymode)
  "The list of Lisp packages required by the polymode layer.")

(defun polymode/init-polymode ()
  "Polymode init function."
  (use-package polymode
    :defer t))

;;; packages.el ends here
