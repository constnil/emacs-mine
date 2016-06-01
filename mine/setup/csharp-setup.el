;;; csharp-setup.el --- C# setups.

;; copyright (c) 2015, wu tiefeng.

;; author: wu tiefeng <icebergwtf@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'var-setup)
(require 'use-package)

(use-package csharp-mode)

(use-package omnisharp
  :defer t
  :config
  (setq omnisharp-server-executable-path "~/warehouse/builds/OmniSharpServer/OmniSharp/bin/Release/OmniSharp.exe"
        ;;        "~/warehouse/builds/omnisharp-roslyn/artifacts/publish/OmniSharp/default/net451/OmniSharp.exe"
        )
  (when (file-exists-p omnisharp-server-executable-path)
    (add-hook 'csharp-mode-hook 'omnisharp-mode)
    (add-to-list 'company-backends 'company-omnisharp)))

(provide 'csharp-setup)

;;; csharp-setup.el ends here
