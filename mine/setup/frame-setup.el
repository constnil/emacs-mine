;;; frame-setup.el --- Frame (mainly under GUI) setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:
(require 'var-setup)

(add-to-list 'default-frame-alist '(height . 25))
(add-to-list 'default-frame-alist '(width . 80))
(if is-mswin
	(add-to-list 'default-frame-alist
				 '(font . "Courier New-12"))
  (add-to-list 'default-frame-alist
			   '(font . "Courier New-16")))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(toggle-frame-fullscreen)

(provide 'frame-setup)

;;; frame-setup.el ends here
