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
  (let ((cygroot (getenv "CYGWIN_ROOT")))
	(use-package cygwin-mount
	  :if cygroot
	  :config
	  (cygwin-mount-activate)
	  ;;	  (setq shell-file-name (expand-file-name "bin/bash.exe" cygroot))
	  )))

(provide 'os-setup)

;;; os-setup.el ends here
