;;; kess-evil.el --- Evil setups.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package evil
  :diminish undo-tree-mode
  :bind (("C-c C-e" . evil-mode)
         :map evil-normal-state-map
         ("j" . evil-next-visual-line)
         ("k" . evil-previous-visual-line)
         ("C-a" . evil-beginning-of-line)
         ("C-e" . evil-end-of-line)
         ([escape] . keyboard-quit)
         :map evil-emacs-state-map
         ([escape] . evil-normal-state))
  :config
  (unbind-key "C-z" evil-motion-state-map)
  (unbind-key "C-z" evil-insert-state-map)

  (use-package evil-search-highlight-persist
    :bind* ("C-c C-/" . evil-search-highlight-persist-remove-all)
    :config
    (global-evil-search-highlight-persist t))

  (use-package evil-surround
    :config
    (global-evil-surround-mode 1))

  (use-package evil-visualstar)

  (use-package evil-numbers
    :bind (:map evil-normal-state-map
           ("+" . evil-numbers/inc-at-pt)
           ("-" . evil-numbers/dec-at-pt)))

  (use-package powerline-evil
    :config
    (powerline-evil-vim-color-theme)
    (display-time-mode t))

  (setq evil-esc-delay 0))

(provide 'kess-evil)

;;; kess-evil.el ends here
