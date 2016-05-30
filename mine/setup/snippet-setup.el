;;; snippet-setup.el --- YASnippet setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (setq yas-snippet-dirs (expand-file-name "snippets" "~/.emacs.d"))
  ;;(yas-global-mode 1)
  )

(provide 'snippet-setup)

;;; snippet-setup.el ends here
