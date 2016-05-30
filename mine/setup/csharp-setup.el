;;; csharp-setup.el --- C# setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'var-setup)
(require 'use-package)

(use-package csharp-mode)

(use-package omnisharp
  :defer t
  ;; :init (push '(company-omnisharp :with company-yasnippet) company-backends-csharp-mode)
  :config
  (add-hook 'csharp-mode-hook 'omnisharp-mode)
  (add-to-list 'company-backends 'company-omnisharp)
  (setq omnisharp-server-executable-path "~/bin/OmniSharp/OmniSharp.exe"))

(provide 'csharp-setup)

;;; csharp-setup.el ends here
