;;; binding-setup.el --- Common key binding setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

;; buffer switching
(require 'buffer-setup)
(global-set-key (kbd "<C-tab>") 'next-non-start-buffer)
(global-set-key (kbd "<C-S-tab>") 'prev-non-start-buffer)
(global-set-key (kbd "M-`") 'kill-buffer-and-window)

;; window switching
(global-set-key (kbd "C-M-o") 'other-window)
(global-set-key (kbd "C-M-,") 'scroll-other-window)
(global-set-key (kbd "C-M-.") 'scroll-other-window-down)
(global-set-key (kbd "C-M-/") 'delete-other-windows)
(global-set-key (kbd "C-M-h") 'windmove-left)
(global-set-key (kbd "C-M-j") 'windmove-down)
(global-set-key (kbd "C-M-k") 'windmove-up)
(global-set-key (kbd "C-M-l") 'windmove-right)

;; search/replace
(global-set-key (kbd "M-?") 'query-replace)
(global-set-key (kbd "C-M-?") 'query-replace-regexp)

;; org-mode
(unbind-key "<C-tab>" org-mode-map)
(define-key org-mode-map (kbd "M-n") 'org-forward-heading-same-level)
(define-key org-mode-map (kbd "M-p") 'org-backward-heading-same-level)
(define-key org-mode-map (kbd "M-u") 'outline-up-heading)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)

;; coding
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c C-u") 'uncomment-region)

;; misc
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-U") 'upcase-word)
(global-set-key (kbd "M-L") 'downcase-word)
(global-set-key (kbd "M-C") 'capitalize-word)

(provide 'binding-setup)

;;; binding-setup.el ends here
