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

;; switch to previous/next buffer (skip *[buffer]*)
;; from stackoverflow, with some modifications
(defun prev-non-start-buffer ()
  "Switch to previous non *[buffer]* buffer."
  (interactive)
  (let ((bread-crumb (buffer-name)))
	(previous-buffer)
	(while (and (string-match-p "^\*" (buffer-name))
				(not (equal bread-crumb (buffer-name))))
	  (previous-buffer))))
(global-set-key (kbd "<C-M-tab>") 'prev-non-start-buffer)

(defun next-non-start-buffer ()
  "Switch to next non *[buffer]* buffer."
  (interactive)
  (let ((bread-crumb (buffer-name)))
	(next-buffer)
	(while (and (string-match-p "^\*.*\*$" (buffer-name))
				(not (equal bread-crumb (buffer-name))))
	  (next-buffer))))
(global-set-key (kbd "<C-tab>") 'next-non-start-buffer)

;; remove minor mode M-h bindings
(require 'nxml-mode)
(add-hook 'nxml-mode-hook
		  (lambda () (define-key nxml-mode-map (kbd "M-h") nil)))

(global-set-key (kbd "M-k") 'kill-buffer)
(global-set-key (kbd "M-`") 'kill-buffer-and-window)

(provide 'buffer-setup)

;;; buffer-setup.el ends here
