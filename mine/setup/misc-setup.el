;;; misc-setup.el --- Uncategorized setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'binding-setup)
(require 'theme-setup)
(require 'completion-setup)

(use-package bookmark+)

(use-package guru-mode
  :config
  (setq guru-warn-only t)
  (guru-global-mode +1))

(setq inhibit-startup-screen t)
(setq gc-cons-threshold 20000000)

;; shell history.
(define-key shell-mode-map (kbd "C-l") 'helm-comint-input-ring)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
		  #'(lambda ()
			  (substitute-key-definition 'eshell-list-history 'helm-eshell-history eshell-mode-map)))

(provide 'misc-setup)

;;; misc-setup.el ends here

