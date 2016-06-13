;;; init.el --- Init file of "KESS - Keep Emacs Simple, Stupid!" config suit.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

;; Setup modules are placed in setup directory
(add-to-list 'load-path (concat user-emacs-directory "/setup"))

(require 'kess-defaults)
(require 'kess-comp)
(require 'kess-org)
(require 'kess-coding)
(require 'kess-evil)

(require 'server)
(when (not (eq (server-running-p) t))
  (server-start))

;;; init.el ends here
