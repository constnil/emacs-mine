;;; kess-coding.el --- Setup coding environment.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'kess-package)

(use-package flycheck
  :diminish flycheck-mode
  :bind* ("C-c C-f" . flycheck-mode)
  :config
  (when (display-graphic-p (selected-frame))
    (eval-after-load 'flycheck
      '(custom-set-variables
        '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))
  (use-package flycheck-pos-tip))

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (setq yas-snippet-dirs (concat user-emacs-directory "snippets"))
  ;;(yas-global-mode 1)
  )

(require 'kess-lisp)
(require 'kess-csharp)

(provide 'kess-coding)

;;; kess-coding.el ends here
