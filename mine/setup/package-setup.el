;;; package-setup.el --- ELPA setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'package)

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (unless (assoc 'use-package package-archive-contents)
	(package-refresh-contents))
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)
(use-package diminish)
(use-package bind-key
  :bind* ("C-." . describe-personal-keybindings))

(provide 'package-setup)

;;; package-setup.el ends here
