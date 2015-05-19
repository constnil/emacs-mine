;;; buffer-setup.el --- Buffer setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package ace-jump-mode
  :config
  (autoload
    'ace-jump-mode-pop-mark "ace-jump-mode" "Ace jump back." t)
  (global-set-key (kbd "M-i") 'ace-jump-mode)
  (global-set-key (kbd "C-M-i") 'ace-jump-mode-pop-mark))

(use-package ace-jump-buffer
  :config
  (global-set-key (kbd "M-p") 'ace-jump-buffer))

(global-set-key (kbd "M-h") 'previous-buffer)
(global-set-key (kbd "M-l") 'next-buffer)
(global-set-key (kbd "M-k") 'kill-buffer)
(global-set-key (kbd "M-c") 'kill-buffer-and-window)

(provide 'buffer-setup)

;;; buffer-setup.el ends here
