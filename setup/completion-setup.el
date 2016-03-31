;;; completion-setup.el --- Completion setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

;; company
(use-package company
  :diminish company-mode
  :config
  (setq company-idle-delay 0.3)
  (setq company-tooltip-limit 12)
  (setq company-minimum-prefix-length 2)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (define-key company-active-map (kbd "M-n") 'company-next-page)
  (define-key company-active-map (kbd "M-p") 'company-previous-page)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (global-company-mode 1))

;; search
(use-package ack)
(use-package ag)

;; ido
(global-set-key (kbd "C-x C-d") 'ido-dired)
(ido-mode +1)
(ido-everywhere +1)
(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode +1))
(use-package flx-ido
  :config
  (setq ido-enable-prefix nil
		ido-enable-flex-matching t
		ido-use-faces nil
		ido-create-new-buffer 'always
		ido-use-filename-at-point 'guess
		ido-max-prospects 10
		ido-default-file-method 'selected-window
		ido-auto-merge-work-directories-length -1)
  (flx-ido-mode +1))

;; helm
(use-package helm
  :config
  (require 'helm-config)
  ;; See https://github.com/bbatsov/prelude/pull/670 for a detailed
  ;; discussion of these options.
  (setq helm-buffers-fuzzy-matching t
		helm-M-x-fuzzy-match t
		helm-apropos-fuzzy-match t
		helm-buffers-fuzzy-matching t
		helm-completion-in-region-fuzzy-match t
		helm-ff-file-name-history-use-recentf t
		helm-ff-search-library-in-sexp t
		helm-imenu-fuzzy-match t
		helm-lisp-fuzzy-completion t
		helm-locate-fuzzy-match t
		helm-mode-fuzzy-match t
		helm-move-to-line-cycle-in-source t
		helm-recentf-fuzzy-match t
		helm-semantic-fuzzy-match t
		helm-split-window-in-side-p t)
  (helm-autoresize-mode 1)
  (global-set-key (kbd "M-h") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "M-m") 'helm-mini)
  (global-set-key (kbd "M-a") 'helm-apropos)
  (global-set-key (kbd "M-i") 'helm-info-emacs)
  (global-set-key (kbd "M-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-p") 'helm-browse-project)
  (global-set-key (kbd "C-x C-r") 'helm-recentf)
  (global-set-key (kbd "C-x C-o") 'helm-find-files)
  (global-set-key (kbd "C-x C-l") 'helm-locate-library)

  (define-key helm-map (kbd "M-a") 'helm-toggle-all-marks)
  (define-key helm-map (kbd "M-m") 'helm-toggle-visible-mark)
  (define-key helm-map (kbd "M-p") 'helm-previous-source)
  (define-key helm-map (kbd "M-n") 'helm-next-source)

  (substitute-key-definition 'find-tag 'helm-etags-select global-map)

  ;; remove minor mode M-h bindings
  (require 'nxml-mode)
  (add-hook 'nxml-mode-hook
			(lambda () (define-key nxml-mode-map (kbd "M-h") nil)))
  (use-package helm-ag
	:config
	(global-set-key (kbd "M-f") 'helm-ag))
  (use-package helm-ls-svn)
  (use-package helm-ls-hg)
  (use-package helm-ls-git)
  (use-package helm-flx)
  (use-package helm-flycheck
	:config
	(global-set-key (kbd "M-c") 'helm-flycheck))
  (use-package helm-flymake
	:config
	(global-set-key (kbd "M-k") 'helm-flymake))
  (use-package helm-descbinds
	:config
	(require 'helm-eshell) 
	(helm-descbinds-mode))
  (helm-mode +1)
  (helm-adaptive-mode +1)
  (helm-push-mark-mode +1))

(provide 'completion-setup)

;;; completion-setup.el ends here
