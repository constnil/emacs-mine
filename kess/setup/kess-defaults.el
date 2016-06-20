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
(use-package better-defaults
  :config
  ;; (setq save-place-file (concat user-emacs-directory "places")
  ;;       backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
  )

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
(setq-default tab-width 4)
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1
      system-time-locale "C"
      inhibit-startup-screen t
      highlight-nonselected-windows t
      gc-cons-threshold 20000000
      tramp-default-method "ssh"
      gdb-many-windows t
      linum-format "%4d")
(global-linum-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Session and History
;; from [[https://ebzzry.github.io/emacs-hacks-2.html][Emacs and Hacks II]]

;; desktop
(require 'desktop)

(desktop-save-mode)

(setq desktop-dirname user-emacs-directory
      desktop-base-file-name "desktop"
      desktop-base-lock-name "desktop.lock"
      desktop-restore-frames t
      desktop-restore-reuses-frames t
      desktop-restore-in-current-display t
      desktop-restore-forces-onscreen t)

(defun save-desktop ()
  (interactive)
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))

(defun save-defaults ()
  (desktop-save desktop-dirname)
  (savehist-save)
  (bookmark-save))

(defun save-current-session ()
  (interactive)
  (save-desktop)
  (save-defaults))

;; savehist
(savehist-mode t)
(setq savehist-file (concat user-emacs-directory "savehist"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Bindings
;;

;; buffer
(bind-key* (kbd "M-`")
           (lambda () (interactive) (kill-buffer (get-buffer (buffer-name)))))

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

;; frame
(bind-keys* ("C-c o" . other-frame)
            ("C-c 0 ." delete-frame))

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

;; marker
(define-prefix-command)
(bind-keys* ("C-` C-`" . set-mark-command))

;; misc
(bind-keys* ("<backspace>" . delete-backward-char)
            ("C-c <tab>" . hippie-expand))

(provide 'kess-defaults)

;;; kess-defaults.el ends here
