;;; evil-setup.el --- Evil setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'dot-emacs-funcs)

(install-packages '(evil
                    goto-chg
                    powerline-evil
                    evil-surround
                    evil-visualstar
                    evil-numbers
                    evil-leader
                    evil-search-highlight-persist))

(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(evil-leader/set-leader ",")

(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)
(evil-leader/set-key "/" 'evil-search-highlight-persist-remove-all)
(global-evil-leader-mode)

(evil-leader/set-key "e" 'evil-ace-jump-word-mode) ; ,e for Ace Jump (word)
(evil-leader/set-key "l" 'evil-ace-jump-line-mode) ; ,l for Ace Jump (line)
(evil-leader/set-key "x" 'evil-ace-jump-char-mode) ; ,x for Ace Jump (char)

(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map [escape] 'keyboard-quit)

(define-key evil-visual-state-map [escape] 'keyboard-quit)

(global-set-key [escape] 'evil-exit-emacs-state)
(global-set-key (kbd "C-c C-v") 'evil-mode)

(evil-mode t)

(provide 'evil-setup)

;;; evil-setup.el ends here
