;;; projectile-setup.el --- Projectile setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-indexing-method 'alien
		projectile-enable-caching t
		projectile-switch-project-action 'projectile-dired))

(provide 'projectile-setup)

;;; projectile-setup.el ends here
