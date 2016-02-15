;;; window-setup.el --- Window setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package popwin
  :config
  (popwin-mode 1))

(use-package ace-window
  :config
  (setq aw-keys
		'(?a ?s ?d ?f ?g ?h ?j ?k ?l ?x ?m ?v ?b ?n ?i ?o))
  (setq aw-dispatch-always t)
  (global-set-key (kbd "M-o") 'ace-window))

(global-set-key (kbd "C-M-h") 'windmove-left)
(global-set-key (kbd "C-M-j") 'windmove-down)
(global-set-key (kbd "C-M-k") 'windmove-up)
(global-set-key (kbd "C-M-l") 'windmove-right)

(winner-mode 1)

(provide 'window-setup)

;;; window-setup.el ends here
