;;; kess-project.el --- Project mangement.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'kess-package)

(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-indexing-method 'alien
        projectile-enable-caching t
        projectile-switch-project-action 'projectile-dired))

(provide 'kess-project)

;;; kess-project.el ends here
