;;; evil-setup.el --- Evil setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package evil
  :config
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (global-set-key [escape] 'evil-exit-emacs-state)
  (global-set-key (kbd "C-c C-v") 'evil-mode)
  (evil-mode))

(use-package evil-leader
  :config
  (setq evil-leader/in-all-states 1)
  (evil-leader/set-leader ",") 
  ;; (evil-leader/set-key "e" 'evil-ace-jump-word-mode) ; ,e for Ace Jump (word)
  ;; (evil-leader/set-key "l" 'evil-ace-jump-line-mode) ; ,l for Ace Jump (line)
  ;; (evil-leader/set-key "x" 'evil-ace-jump-char-mode) ; ,x for Ace Jump (char)
  (global-evil-leader-mode))

(use-package evil-search-highlight-persist
  :config
  (global-evil-search-highlight-persist t)
  (evil-leader/set-key "/" 'evil-search-highlight-persist-remove-all))

(use-package powerline-evil
  :config
  (powerline-evil-vim-color-theme)
  (display-time-mode t))

(use-package goto-chg)
(use-package evil-surround)
(use-package evil-visualstar)
(use-package evil-numbers)

(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

(provide 'evil-setup)

;;; evil-setup.el ends here
