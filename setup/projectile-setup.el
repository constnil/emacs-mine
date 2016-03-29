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
		projectile-switch-project-action 'projectile-dired)
  (use-package ag)
  (use-package helm-projectile
	:config
	;; enable Helm version of Projectile with replacment commands
	(helm-projectile-on)
	(global-set-key (kbd "M-o") 'helm-projectile-find-file)
	(global-set-key (kbd "M-O") 'helm-projectile-find-dir)
	(global-set-key (kbd "M-p") 'helm-projectile-switch-project)
	(global-set-key (kbd "M-P") 'helm-projectile)))

(provide 'projectile-setup)

;;; projectile-setup.el ends here
