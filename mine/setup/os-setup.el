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
  (let* ((cygroot (getenv "CYGWIN_ROOT"))
		 (cygbin (concat cygroot "/bin")))
	(use-package cygwin-mount
	  :disabled t
	  :if cygroot
	  :config
	  (cygwin-mount-activate)
	  (when (file-readable-p cygroot)
		(setq exec-path (cons cygbin exec-path))
		(setenv "PATH" (concat cygbin ";" (getenv "PATH")))
		;; NT-emacs assumes a Windows shell. Change to bash.
		(setq shell-file-name "bash")
		(setenv "SHELL" shell-file-name)
		(setq explicit-shell-file-name shell-file-name)
		;; This removes unsightly ^M characters that would otherwise
		;; appear in the output of java applications.
		(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)))))

(when is-mac
  (setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH"))))

(provide 'os-setup)

;;; os-setup.el ends here
