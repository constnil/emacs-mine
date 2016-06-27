<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Preface</a></li>
<li><a href="#sec-2">2. Suit management will not use submodule</a></li>
<li><a href="#sec-3">3. Use cask and ecukes for study purpose?</a></li>
<li><a href="#sec-4">4. Functions for emacs study?</a></li>
<li><a href="#sec-5">5. Change "mine" suit to "kess - Keep Emacs Simple, Stupid" suit</a></li>
<li><a href="#sec-6">6. Thoughts</a>
<ul>
<li><a href="#sec-6-1">6.1. Preview for dired-mode</a></li>
<li><a href="#sec-6-2">6.2. Suit Load</a></li>
</ul>
</li>
</ul>
</div>
</div>


# Preface<a id="sec-1" name="sec-1"></a>

*(This was originally my emacs configuration backup repository)*

There are hundreds of emacs config repositories on github (prelude, emacs-live,
spacemacs, etc). I started by including them individualy as submodule (so called
"config suit") and load particular suit specified by environment variable
$EMACS<sub>CONFIG</sub> on emacs startup. Thus I can easily taste and study them, not mess
up my own configuration.

# Suit management will not use submodule<a id="sec-2" name="sec-2"></a>

-   How to define suit? (name, repos location, &#x2026;)
-   Maybe not use environment variable too?
-   Which famous suits too include by default?

# Use cask and ecukes for study purpose?<a id="sec-3" name="sec-3"></a>

# Functions for emacs study?<a id="sec-4" name="sec-4"></a>

-   Insert command name by key press

# Change "mine" suit to "kess - Keep Emacs Simple, Stupid" suit<a id="sec-5" name="sec-5"></a>

-   [X] make kess as default
-   [X] C-\` prefix key map, mainly for mark related commands
-   [ ] C-backspace backward-delete-line
-   [ ] M-backspace backward-delete-word

# Thoughts<a id="sec-6" name="sec-6"></a>

## Preview for dired-mode<a id="sec-6-1" name="sec-6-1"></a>

## Suit Load<a id="sec-6-2" name="sec-6-2"></a>

    ;; Common setting and variables
    (prefer-coding-system 'utf-8)
    
    (defvar suit-init-file "init.el")
    
    ;; Load specified config suit from the following list:
    ;;    live - "emacs-live" (git://github.com/overtone/emacs-live.git)
    ;; prelude - "prelude" (git://github.com/bbatsov/prelude.git)
    ;;   space - "spacemacs" (git://github.com/syl20bnr/spacemacs.git)
    ;;   bling - "bling's KISS dotemacs" (git://github.com/bling/dotemacs.git)
    ;;  sachac - "sacha chua's .emacs.d (git://github.com/sachac/.emacs.d.git)"
    ;;    kess - "my 'Keep Emacs Simple, Stupid' config suit" (default)
    (let* ((suits '("live" "prelude" "space" "bling" "sachac" "kess"))
           (env (getenv "EMACS_CONFIG"))
           (suit (or (and (member env suits) env) "kess")))
      (setenv "EMACS_CONFIG" suit) ; In case environment variable not set
      (message "start config suit \"%s\" loading on %s" suit system-type)
    
      ;; Set common package 'elpa' directory to share packages between suits
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
