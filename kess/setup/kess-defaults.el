;;; kess-defaults.el --- Kess config suit default settings.

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'kess-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Use better-defaults package as start point
;;
(use-package better-defaults)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Apperence
;;
(load-theme 'tango-dark)

(when window-system
  (menu-bar-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Settings
;;
(global-linum-mode t)
(setq-default tab-width 4)
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1
      system-time-locale "C"
      inhibit-startup-screen t
      highlight-nonselected-windows t
      gc-cons-threshold 20000000
      tramp-default-method "ssh"
      gdb-many-windows t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Bindings
;;

;; buffer
(bind-key* (kbd "M-`") 'kill-buffer-and-window)

;; switch to previous/next buffer (skip *[buffer]*), idea from stackoverflow
(defun switch-non-star-muffle-buffer (next)
  "Switch to non *[buffer]* buffer, use next-buffer when NEXT is t,
otherwise, previous-buffer."
  (let ((bread-crumb (buffer-name))
        (fn (or (and next 'next-buffer) 'previous-buffer)))
    (funcall fn)
    (while (and (not (equal bread-crumb (buffer-name)))
                (and (not (member (buffer-name) '("*scratch*" "*info*")))
                     (string-match-p "^\*.*\*$" (buffer-name))))
      (funcall fn))))
(bind-keys*
 ("<C-tab>" . (lambda () (interactive) (switch-non-star-muffle-buffer t)))
 ("<C-S-tab>" . (lambda () (interactive) (switch-non-star-muffle-buffer nil)))
 ("C-M-|" . (lambda ()
              (interactive)
              (message "TODO: indent whole buffer"))))

;; window
(winner-mode 1)
(bind-keys* ("C-c ," . winner-undo)
            ("C-c ." . winner-redo))

(bind-keys* ("C-M-." . scroll-other-window)
            ("C-M-," . scroll-other-window-down)
            ("C-M-h" . windmove-left)
            ("C-M-j" . windmove-down)
            ("C-M-k" . windmove-up)
            ("C-M-l" . windmove-right))

;; navigation
(bind-keys ("M-n" . forward-paragraph)
           ("M-p" . backward-paragraph))

;; search/replace
(bind-keys* ("C-M-/" . query-replace)
            ("C-M-?" . query-replace-regexp))

;; case change
(bind-keys* ("M-U" . upcase-word)
            ("M-L" . downcase-word)
            ("M-C" . capitalize-word))

;; misc
(bind-keys* ("C-h" . delete-backward-char)
            ("<backspace>" . delete-backward-char)
            ("C-`" . set-mark-command))

(provide 'kess-defaults)

;;; kess-defaults.el ends here
