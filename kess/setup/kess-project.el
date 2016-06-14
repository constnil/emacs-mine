;;; kess-project.el --- Project mangement.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'kess-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; projectile
;;
(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-indexing-method 'alien
        projectile-enable-caching t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; find file in project
;;
(use-package find-file-in-project
  :ensure ivy)

(provide 'kess-project)

;;; kess-project.el ends here
