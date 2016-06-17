;;; init.el --- Init file of "KESS - Keep Emacs Simple, Stupid!" config suit.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:
;; Simple load kess.org, let org-babel do the real work.

;;; Code:

(org-babel-load-file (concat user-emacs-directory "kess.org"))

;;; init.el ends here
