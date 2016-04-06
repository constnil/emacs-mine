;;; init.el --- The init file "emacs-mine" config.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(prefer-coding-system 'utf-8)

(let* ((load-dir (file-name-directory load-file-name))
       (setup-dir (expand-file-name "setup" load-dir)))
  (add-to-list 'load-path setup-dir))

(require 'package-setup)
(require 'os-setup)
(require 'frame-setup)
(require 'buffer-setup)
(require 'window-setup)
(require 'minibuf-setup)
(require 'evil-setup)
(require 'coding-setup)
(require 'misc-setup)
(require 'server-setup)
(require 'customize-setup)

;;; init.el ends here
