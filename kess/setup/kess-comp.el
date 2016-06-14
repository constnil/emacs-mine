;;; kess-comp.el --- Completions (ido/smex/company/...) settings.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'kess-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ido
;;
(ido-mode 1)
(ido-everywhere 1)

(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode 1))

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
  (flx-ido-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; smex
;;
(use-package smex
  :bind* (("M-x" . smex)
          ("M-X" . smex-major-mode-commands)
          ("C-c M-x" . execute-extended-command)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; company
;;
(use-package company
  :diminish company-mode
  :demand
  :bind (:map company-active-map
              ("M-n" . company-next-page)
              ("M-p" . company-previous-page)
              ("C-n" . company-select-next-or-abort)
              ("C-p" . company-select-previous-or-abort))
  :config
  (setq company-idle-delay 0.3
        company-tooltip-limit 12
        company-minimum-prefix-length 2)
  (global-company-mode 1))

(provide 'kess-comp)

;;; kess-comp.el ends here
