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
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t)
  (setq projectile-switch-project-action 'projectile-dired)
										;(projectile-tags-command "etags -Re -f \"%s\" %s")
  (global-set-key [f5] 'projectile-find-file))

(use-package helm-projectile)

(provide 'projectile-setup)

;;; projectile-setup.el ends here
