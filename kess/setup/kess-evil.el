;;; kess-evil.el --- Evil setups.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package evil
  :diminish undo-tree-mode
  :bind (("C-~" . evil-mode)
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

  (setq evil-esc-delay 0)

  (use-package evil-visualstar
    :config
    (global-evil-visualstar-mode t))

  (use-package evil-numbers
    :bind (:map evil-normal-state-map
                ("+" . evil-numbers/inc-at-pt)
                ("-" . evil-numbers/dec-at-pt))))

(provide 'kess-evil)

;;; kess-evil.el ends here
