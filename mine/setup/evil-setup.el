;;; evil-setup.el --- Evil setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package evil
  :diminish undo-tree-mode
  :config
  (unbind-key "C-z" evil-motion-state-map)
  (unbind-key "C-z" evil-insert-state-map)

  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "C-a") 'evil-beginning-of-line)
  (define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line)
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  
  (define-key evil-emacs-state-map [escape] 'evil-normal-state)

  (use-package evil-search-highlight-persist
    :config
    (global-evil-search-highlight-persist t)
    (global-set-key (kbd "C-c C-/")
                    'evil-search-highlight-persist-remove-all))

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

  (use-package powerline-evil
    :config
    (powerline-evil-vim-color-theme)
    (display-time-mode t))

  (setq scroll-margin 5
        scroll-conservatively 9999
        scroll-step 1)

  (global-set-key (kbd "C-`") 'evil-mode)
  (setq evil-esc-delay 0))

(provide 'evil-setup)

;;; evil-setup.el ends here
