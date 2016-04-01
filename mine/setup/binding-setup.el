;;; binding-setup.el --- Common key binding setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-M-,") 'scroll-other-window)
(global-set-key (kbd "C-M-.") 'scroll-other-window-down)
(global-set-key (kbd "C-M-/") 'delete-other-windows)

(provide 'binding-setup)

;;; binding-setup.el ends here
