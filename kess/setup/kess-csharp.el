;;; kess-csharp.el --- C# setups.

;; copyright (C) 2016, wu tiefeng.

;; author: wu tiefeng <icebergwtf@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'kess-package)

(use-package csharp-mode)

;; (use-package omnisharp
;;   :config
;;   (setq omnisharp-server-executable-path "~/warehouse/builds/OmniSharpServer/OmniSharp/bin/Release/OmniSharp.exe"
;;         ;;        "~/warehouse/builds/omnisharp-roslyn/artifacts/publish/OmniSharp/default/net451/OmniSharp.exe"
;;         )
;;   (when (file-exists-p omnisharp-server-executable-path)
;;     (add-hook 'csharp-mode-hook 'omnisharp-mode)
;;     (add-to-list 'company-backends 'company-omnisharp)))

(provide 'kess-csharp)

;;; kess-csharp.el ends here
