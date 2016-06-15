;;; os-setup.el --- OS related setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'var-setup)
(require 'use-package)

;; MS Windows setup
(when is-mswin
  (setq file-name-coding-system 'gbk))

;; OSX setup
(when is-mac
  (setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH"))))

(provide 'os-setup)

;;; os-setup.el ends here
