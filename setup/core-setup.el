;;; core-setup.el --- Basic emacs working environment setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'package-setup)
(require 'evil-setup)

(global-set-key (kbd "C-h") `delete-backward-char)
(global-set-key (kbd "M-/") `help-command)

(require 'buffer-setup)
(require 'window-setup)
(require 'frame-setup)

(provide 'core-setup)

;;; core-setup.el ends here
