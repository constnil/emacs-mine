;;; evil-setup.el --- Evil setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package evil-search-highlight-persist
  :config
  (global-evil-search-highlight-persist t))

(use-package evil-leader
  :config
  (setq evil-leader/in-all-states 1)
  (evil-leader/set-leader "SPC")
  
  (evil-leader/set-key "j" 'evil-ace-jump-char-mode)
  (evil-leader/set-key "k" 'evil-ace-jump-word-mode)
  (evil-leader/set-key "l" 'evil-ace-jump-line-mode)

  (evil-leader/set-key "d" 'evil-delete-buffer)
  (evil-leader/set-key "n" 'evil-next-buffer)
  (evil-leader/set-key "p" 'evil-prev-buffer)

  (evil-leader/set-key "w" 'evil-write)
  (evil-leader/set-key "W" 'evil-write-all)

  (evil-leader/set-key "b" 'eval-buffer)
  (evil-leader/set-key "e" 'eval-defun)
  (evil-leader/set-key "s" 'eval-last-sexp)

  (evil-leader/set-key "i" 'evil-insert)
  (evil-leader/set-key "/" 'evil-search-highlight-persist-remove-all)

  (global-evil-leader-mode))

(use-package evil
  :diminish undo-tree-mode
  :config
  (add-hook 'evil-insert-state-entry-hook
			(lambda (&rest args) (evil-emacs-state 1)))
  (define-key evil-emacs-state-map [escape] 'evil-normal-state)

  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "C-a") 'evil-beginning-of-line)
  (define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line)
  (define-key evil-normal-state-map [escape] 'keyboard-quit)

  (global-set-key (kbd "C-c C-e") 'evil-mode)
  (setq evil-esc-delay 0)
  (evil-mode 1))

(use-package powerline-evil
  :config
  (powerline-evil-vim-color-theme)
  (display-time-mode t))

(use-package goto-chg)

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-visualstar)
(use-package evil-numbers
  :config
  (define-key evil-normal-state-map (kbd "+")
    'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "-")
    'evil-numbers/dec-at-pt))

(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

(provide 'evil-setup)

;;; evil-setup.el ends here
