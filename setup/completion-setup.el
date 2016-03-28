;;; completion-setup.el --- Completion setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

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
  (global-company-mode 1))

;; helm
(use-package helm
  :config
  (require 'helm-config)
  (global-set-key (kbd "M-h") 'helm-M-x)
  (helm-mode 1))

;; ido
(ido-mode +1)
(ido-everywhere +1)
(use-package flx-ido
  :config
  (setq gc-cons-threshold 20000000)
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))


(provide 'completion-setup)

;;; completion-setup.el ends here
