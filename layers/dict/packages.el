;;; packages.el --- dict layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Sergei Matveev <rstone@forge>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst dict-packages
  '(goldendict)
  "The list of Lisp packages required by the dict layer.")

(defun dict/init-goldendict ()
  (use-package goldendict
    :defer t
    :init
    (spacemacs/set-leader-keys
      "ot" 'goldendict-dwim)))

;;; packages.el ends here
