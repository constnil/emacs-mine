;;; completion-setup.el --- Completion setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

;; search
(use-package ack)
(use-package ag)

;; company
(use-package company
  :diminish company-mode
  :config
  (setq company-idle-delay 0.3)
  (setq company-tooltip-limit 12)
  (setq company-minimum-prefix-length 2)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (define-key company-active-map (kbd "M-n") 'company-next-page)
  (define-key company-active-map (kbd "M-p") 'company-previous-page)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (global-company-mode 1))

;; ido
(ido-mode +1)
(ido-everywhere +1)
(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode +1))
(use-package flx-ido
  :config
  (setq ido-enable-prefix nil
		ido-enable-flex-matching t
		ido-use-faces nil
		ido-create-new-buffer 'always
		ido-use-filename-at-point 'guess
		ido-max-prospects 10
		ido-default-file-method 'selected-window
		ido-auto-merge-work-directories-length -1)
  (flx-ido-mode +1))

(provide 'completion-setup)

;;; completion-setup.el ends here
