;; Common setting and variables
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-locale-environment "utf-8")

(defvar suit-init-file "init.el")

;; Load specified config suit from the following list:
;;    live - "emacs-live" (git://github.com/overtone/emacs-live.git)
;; prelude - "prelude" (git://github.com/bbatsov/prelude.git)
;;   space - "spacemacs" (git://github.com/syl20bnr/spacemacs.git)
;;   bling - "bling's KISS dotemacs" (git://github.com/bling/dotemacs.git)
;;  sachac - "sacha chua's .emacs.d (git://github.com/sachac/.emacs.d.git)"
;; purcell - "Steve Purcell's emacs.d (git://github.com/purcell/emacs.d.git)"
;;    kess - "my 'Keep Emacs Simple, Stupid' config suit" (default)
(let\* ((suits '("live" "prelude" "space" "bling" "sachac" "purcell" "kess"))
       (env (getenv "EMACS<sub>CONFIG</sub>"))
       (suit (or (and (member env suits) env) "kess")))
  (setenv "EMACS<sub>CONFIG</sub>" suit) ; In case environment variable not set
  (message "start config suit \\"%s\\" loading on %s" suit system-type)

;; Set common package 'elpa' directory to share packages between suits
;; NOTE: some suits (like prelude) might change it to their own directory
(require 'package)
(setq package-user-dir (concat user-emacs-directory "elpa"))

;; Load suit preset file if exists
;; Opportunity for adjusting given suit, such as change suit-init-file, etc.
(load (concat user-emacs-directory "suits/" suit ".el") 'noerror)

;; HACK: Change user-emacs-directory to suit directory
(setq user-emacs-directory (concat user-emacs-directory suit "/"))

;; Load config suit
(load (concat user-emacs-directory suit-init-file))

;; Personal settings can be set in ~/.personal.el file, if exists.
(load "~/.personal.el" 'noerror)

;; Set emacs customize file to ~/.local.el and try to load it.  Since this
;; emacs configuration is used on my multiple computers, load local setting
;; such as emacs customize, font size, frame size etc., per machine through
;; .local.el file, if exists.
(setq custom-file "~/.local.el")
(load "~/.local.el" 'noerror)

(message "config suit \\"%s\\" loaded" suit))
