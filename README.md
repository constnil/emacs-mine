
# Table of Contents

1.  [Preface](#org633747a)
2.  [My custom aliases](#orgf6213a4)
    1.  [Mine prefix aliases](#orgf0b3178)
    2.  [Emacs command aliases, they can be used follow above mine prefixes, like 'prelude emacw'](#org73c3303)
3.  [Mine Loading](#orgd0caaa1)



<a id="org633747a"></a>

# Preface

*(This was originally my emacs configuration backup repository)*

There are hundreds of emacs config repositories on github (prelude,
emacs-live, spacemacs, etc). I started by including them individualy
as submodule (so called "*emacs mine*") and load particular *mine*
specified by environment variable $EMACS<sub>MINE</sub> on emacs startup. Thus I
can easily taste and study them, not mess up my own configuration.


<a id="orgf6213a4"></a>

# My custom aliases


<a id="orgf0b3178"></a>

## Mine prefix aliases

-   alias prelude='export EMACS<sub>MINE</sub>="prelude" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias live='export EMACS<sub>MINE</sub>="live" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias space='export EMACS<sub>MINE</sub>="space" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias bling='export EMACS<sub>MINE</sub>="bling" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias sachac='export EMACS<sub>MINE</sub>="sachac" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias purcell='export EMACS<sub>MINE</sub>="purcell" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias kess='export EMACS<sub>MINE</sub>="kess" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'


<a id="org73c3303"></a>

## Emacs command aliases, they can be used follow above mine prefixes, like 'prelude emacw'

-   alias vanilla='emacs -nw -q'
-   alias emacn='emacs -nw'
-   alias emacd='emacs -nw &#x2013;debug-init'
-   alias emawd='emacs &#x2013;debug-init &'
-   alias emact='emacsclient -t'
-   alias emacw='emacsclient -c &'


<a id="orgd0caaa1"></a>

# Mine Loading

    ;; Common setting and variables
    (prefer-coding-system 'utf-8)
    (set-language-environment 'utf-8)
    (set-locale-environment "utf-8")

    ;; try load ~/.local-preset.el to setup prerequests, if exists
    (load (expand-file-name "~/.local-preset.el") 'noerror)

    ;; default mine init file, if mine's init file is not named init.el,
    ;; then change it in mine preset file, see below.
    (defvar mine-init-file "init.el")

    ;; Load specified mines from the following list:
    ;;    live - emacs-live (https://github.com/overtone/emacs-live.git)
    ;; prelude - prelude (https://github.com/bbatsov/prelude.git)
    ;;   space - spacemacs (https://github.com/syl20bnr/spacemacs.git)
    ;;   bling - bling's KISS dotemacs (https://github.com/bling/dotemacs.git)
    ;;  sachac - Sacha Chua's .emacs.d (https://github.com/sachac/.emacs.d.git)
    ;; purcell - Steve Purcell's emacs.d (https://github.com/purcell/emacs.d.git)
    ;;    kess - default "Keep Emacs Simple, Stupid" mine
    (let* ((mines '("live" "prelude" "space" "bling" "sachac" "purcell" "kess" "constnil"))
           (env (getenv "EMACS_MINE"))
           (mine (or (and (member env mines) env) "constnil")))
      (setenv "EMACS_MINE" mine)  ; In case environment variable not set
      (message "start mine \"%s\" loading on %s" mine system-type)

      (let ((user-dir (file-name-as-directory user-emacs-directory)))
        (setq user-emacs-directory
    	  (file-name-as-directory (concat user-dir "mines/" mine))))
      (message "root path of mine \"%s\": %s" mine user-emacs-directory)

      ;; Set package.el 'elpa' directory to mine's own elpa directory
      (require 'package)
      (setq package-user-dir (concat user-emacs-directory "elpa/"))

      ;; Load mine preset file if exists.
      ;; Opportunity for adjusting given mine, such as change mine-init-file, etc.
      (load (concat user-emacs-directory mine ".el") 'noerror)

      ;; Set emacs customize file for loading mine.
      (setq custom-file (concat user-emacs-directory mine "-custom.el"))
      (load custom-file 'noerror)

      (setq user-init-file (concat user-emacs-directory mine-init-file))
      (load user-init-file)

      ;; Personal settings can be set in ~/.personal.el file, if exists.
      (load (expand-file-name "~/.personal.el") 'noerror)

      ;; Load post set file if exists. I use it to specify machine local
      ;; settings such as font size, frame size, etc.
      (load (expand-file-name "~/.local-postset.el") 'noerror)

      ;; Done
      (message "mine \"%s\" loaded" mine))
