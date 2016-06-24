;;; init.el --- Emacs initial file

;; Copyright (C) 2016, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

;; Common setting and variables
(prefer-coding-system 'utf-8)

(defvar suit-init-file "init.el")

;; Load specified config suit from the following list:
;;    live - "emacs-live" (git://github.com/overtone/emacs-live.git)
;; prelude - "prelude" (git://github.com/bbatsov/prelude.git)
;;   space - "spacemacs" (git://github.com/syl20bnr/spacemacs.git)
;;   bling - "bling's KISS dotemacs" (git://github.com/bling/dotemacs.git)
;;  sachac - "sacha chua s .emacs.d (git://github.com/sachac/.emacs.d.git)"
;;    kess - "my 'Keep Emacs Simple, Stupid' config suit" (default)
(let* ((suits '("live" "prelude" "space" "bling" "sachac" "kess"))
       (env (getenv "EMACS_CONFIG"))
       (suit (or (and (member env suits) env) "kess")))
  (setenv "EMACS_CONFIG" suit) ; In case environment variable not set
  (message "start config suit \"%s\" loading on %s" suit system-type)

  ;; Set common package 'elpa' directory to share packages between packages
  ;; NOTE: some suits (like prelude) might change it to their own directory
  (require 'package)
  (setq package-user-dir (concat user-emacs-directory "elpa"))

  ;; Load suit preset file if exists
  ;; Opportunity for adjusting given suit, such as change suit-init-file, etc.
  (load (concat user-emacs-directory "suits/" suit ".el") 'noerror)

  ;; HACK: Change user-emacs-directory to suit directory
  (setq user-emacs-directory (concat user-emacs-directory suit "/"))
  (add-to-list 'load-path user-emacs-directory)

  ;; Load config suit
  (load (concat user-emacs-directory suit-init-file))

  ;; Set emacs customize file and load, personal settings can load through
  ;; .personal.el file as well
  (setq custom-file "~/.personal.el")
  (load custom-file 'noerror)

  ;; Since this emacs configuration is used on other computers, load local
  ;; setting such as font size, frame size through .local.el file, if exists.
  (load "~/.local.el" 'noerror)

  (message "config suit \"%s\" loaded" suit))

;;; init.el ends here
