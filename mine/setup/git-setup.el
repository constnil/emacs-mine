;;; git-setup.el --- Magit setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package magit
  :config
  (setq magit-last-seen-setup-instructions "1.4.0")
  (add-hook 'magit-log-edit-mode-hook
            (lambda ()
              (set-fill-column 72)
              (auto-fill-mode 1))))

(provide 'git-setup)

;;; git-setup.el ends here
