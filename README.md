<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Preface</a></li>
<li><a href="#sec-2">2. Mine Loading</a></li>
<li><a href="#sec-3">3. My custom aliases</a>
<ul>
<li><a href="#sec-3-1">3.1. Mine prefix aliases</a></li>
<li><a href="#sec-3-2">3.2. Emacs command aliases, they can be used follow above mine prefixes, like 'prelude emacw'</a></li>
</ul>
</li>
<li><a href="#sec-4">4. Mine management will not use submodule</a></li>
<li><a href="#sec-5">5. Use cask and ecukes for study purpose?</a></li>
<li><a href="#sec-6">6. Functions for emacs study?</a></li>
<li><a href="#sec-7">7. Learning Plan</a>
<ul>
<li><a href="#sec-7-1">7.1. As text editor</a>
<ul>
<li><a href="#sec-7-1-1">7.1.1. global search (grep/ack/ag)</a></li>
<li><a href="#sec-7-1-2">7.1.2. open recent file</a></li>
</ul>
</li>
<li><a href="#sec-7-2">7.2. As system management tool</a>
<ul>
<li><a href="#sec-7-2-1">7.2.1. eshell-mode</a></li>
<li><a href="#sec-7-2-2">7.2.2. shell-mode</a></li>
<li><a href="#sec-7-2-3">7.2.3. term-mode</a></li>
<li><a href="#sec-7-2-4">7.2.4. package management</a>
<ul>
<li><a href="#sec-7-2-4-1">7.2.4.1. el-get</a></li>
<li><a href="#sec-7-2-4-2">7.2.4.2. package.el</a></li>
<li><a href="#sec-7-2-4-3">7.2.4.3. use-package</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-7-3">7.3. As personal task management tool</a>
<ul>
<li><a href="#sec-7-3-1">7.3.1. OrgMode</a></li>
</ul>
</li>
<li><a href="#sec-7-4">7.4. As programming IDE</a>
<ul>
<li><a href="#sec-7-4-1">7.4.1. project management</a>
<ul>
<li><a href="#sec-7-4-1-1">7.4.1.1. projectile</a></li>
<li><a href="#sec-7-4-1-2">7.4.1.2. find-file-in-project</a></li>
</ul>
</li>
<li><a href="#sec-7-4-2">7.4.2. pair wrapping</a></li>
<li><a href="#sec-7-4-3">7.4.3. comment management</a></li>
</ul>
</li>
<li><a href="#sec-7-5">7.5. As elisp IDE</a>
<ul>
<li><a href="#sec-7-5-1">7.5.1. paredit</a></li>
<li><a href="#sec-7-5-2">7.5.2. emacs-lisp-mode</a></li>
<li><a href="#sec-7-5-3">7.5.3. lisp-interaction-mode</a></li>
<li><a href="#sec-7-5-4">7.5.4. cask</a></li>
<li><a href="#sec-7-5-5">7.5.5. ecukes</a></li>
</ul>
</li>
<li><a href="#sec-7-6">7.6. As ruby IDE</a></li>
<li><a href="#sec-7-7">7.7. As clojure IDE</a>
<ul>
<li><a href="#sec-7-7-1">7.7.1. clojure-mode</a></li>
<li><a href="#sec-7-7-2">7.7.2. cider</a></li>
</ul>
</li>
<li><a href="#sec-7-8">7.8. As C# IDE</a>
<ul>
<li><a href="#sec-7-8-1">7.8.1. csharp-mode</a></li>
<li><a href="#sec-7-8-2">7.8.2. omnisharp-emacs</a></li>
</ul>
</li>
<li><a href="#sec-7-9">7.9. Dig into</a>
<ul>
<li><a href="#sec-7-9-1">7.9.1. emacs source code</a>
<ul>
<li><a href="#sec-7-9-1-1">7.9.1.1. <span class="todo TODO">TODO</span> Build Emacs under Msys2 reference</a></li>
</ul>
</li>
<li><a href="#sec-7-9-2">7.9.2. how emacs key binding works</a></li>
<li><a href="#sec-7-9-3">7.9.3. find key binding's original and current value in all minor/major modes</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>


# Preface<a id="sec-1" name="sec-1"></a>

*(This was originally my emacs configuration backup repository)*

There are hundreds of emacs config repositories on github (prelude, emacs-live,
spacemacs, etc). I started by including them individualy as submodule (so called
"*emacs mine*") and load particular *mine* specified by environment variable
$EMACS<sub>MINE</sub> on emacs startup. Thus I can easily taste and study them, not mess
up my own configuration.

# Mine Loading<a id="sec-2" name="sec-2"></a>

    ;; Common setting and variables
    (prefer-coding-system 'utf-8)
    (set-language-environment 'utf-8)
    (set-locale-environment "utf-8")
    
    ;; try load local ~/.emacs-mine.el to setup prerequests, if exists
    (load (expand-file-name "~/.local-preset.el") 'noerror)
    
    ;; mine directory, will set to user-emacs-directory after preset loaded
    (defvar mine-root-path nil)
    
    ;; default mine init file, if mine's init file is not named init.el,
    ;; then change it in mine preset file, see below.
    (defvar mine-init-file "init.el")
    
    ;; Load specified mines from the following list:
    ;;    live - emacs-live (git://github.com/overtone/emacs-live.git)
    ;; prelude - prelude (git://github.com/bbatsov/prelude.git)
    ;;   space - spacemacs (git://github.com/syl20bnr/spacemacs.git)
    ;;   bling - bling's KISS dotemacs (git://github.com/bling/dotemacs.git)
    ;;  sachac - Sacha Chua's .emacs.d (git://github.com/sachac/.emacs.d.git)
    ;; purcell - Steve Purcell's emacs.d (git://github.com/purcell/emacs.d.git)
    ;;    kess - default "Keep Emacs Simple, Stupid" mine
    (let* ((mines '("live" "prelude" "space" "bling" "sachac" "purcell" "kess"))
           (env (getenv "EMACS_MINE"))
           (mine (or (and (member env mines) env) "kess")))
      (setenv "EMACS_MINE" mine)  ; In case environment variable not set
      (message "start mine \"%s\" loading on %s" mine system-type)
    
      (setq user-emacs-directory
            (file-name-as-directory (expand-file-name user-emacs-directory)))
      (setq mine-root-path
            (file-name-as-directory (expand-file-name mine user-emacs-directory)))
      (message "root path of mine \"%s\": %s" mine mine-root-path)
    
      ;; Set package.el 'elpa' directory to mine's own elpa directory
      (require 'package)
      (setq package-user-dir (concat mine-root-path "elpa/"))
    
      ;; Load mine preset file if exists.
      ;; Opportunity for adjusting given mine, such as change mine-init-file, etc.
      (load (concat user-emacs-directory "presets/" mine ".el") 'noerror)
    
      ;; Set emacs customize file for loading mine.
      (setq custom-file (concat user-emacs-directory "customizes/" mine ".el"))
      (load custom-file 'noerror)
    
      ;; HACK: Change user-emacs-directory to mine's root directory, and load it
      (setq user-emacs-directory mine-root-path)
      (load (concat user-emacs-directory mine-init-file))
    
      ;; Personal settings can be set in ~/.personal.el file, if exists.
      (load (expand-file-name "~/.personal.el") 'noerror)
    
      ;; Load post set file if exists. I use it to specify machine local
      ;; settings such as font size, frame size, etc.
      (load (expand-file-name "~/.local-postset.el") 'noerror)
    
      ;; Done
      (message "mine \"%s\" loaded" mine))

# My custom aliases<a id="sec-3" name="sec-3"></a>

## Mine prefix aliases<a id="sec-3-1" name="sec-3-1"></a>

-   alias prelude='export EMACS<sub>MINE</sub>="prelude" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias live='export EMACS<sub>MINE</sub>="live" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias space='export EMACS<sub>MINE</sub>="space" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias bling='export EMACS<sub>MINE</sub>="bling" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias sachac='export EMACS<sub>MINE</sub>="sachac" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias purcell='export EMACS<sub>MINE</sub>="purcell" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'
-   alias kess='export EMACS<sub>MINE</sub>="kess" && echo "launch emacs using mine: $EMACS<sub>MINE</sub>" &&'

## Emacs command aliases, they can be used follow above mine prefixes, like 'prelude emacw'<a id="sec-3-2" name="sec-3-2"></a>

-   alias vanilla='emacs -nw -q'
-   alias emacn='emacs -nw'
-   alias emacd='emacs -nw &#x2013;debug-init'
-   alias emawd='emacs &#x2013;debug-init &'
-   alias emact='emacsclient -t'
-   alias emacw='emacsclient -c &'

# Mine management will not use submodule<a id="sec-4" name="sec-4"></a>

-   How to define mine? (name, repos location, &#x2026;)
-   Maybe not use environment variable too?
-   Which famous mines too include by default?

# Use cask and ecukes for study purpose?<a id="sec-5" name="sec-5"></a>

# Functions for emacs study?<a id="sec-6" name="sec-6"></a>

-   Insert command name by key press

# Learning Plan<a id="sec-7" name="sec-7"></a>

## As text editor<a id="sec-7-1" name="sec-7-1"></a>

### global search (grep/ack/ag)<a id="sec-7-1-1" name="sec-7-1-1"></a>

### open recent file<a id="sec-7-1-2" name="sec-7-1-2"></a>

## As system management tool<a id="sec-7-2" name="sec-7-2"></a>

### eshell-mode<a id="sec-7-2-1" name="sec-7-2-1"></a>

### shell-mode<a id="sec-7-2-2" name="sec-7-2-2"></a>

### term-mode<a id="sec-7-2-3" name="sec-7-2-3"></a>

### package management<a id="sec-7-2-4" name="sec-7-2-4"></a>

#### el-get<a id="sec-7-2-4-1" name="sec-7-2-4-1"></a>

#### package.el<a id="sec-7-2-4-2" name="sec-7-2-4-2"></a>

#### use-package<a id="sec-7-2-4-3" name="sec-7-2-4-3"></a>

## As personal task management tool<a id="sec-7-3" name="sec-7-3"></a>

### OrgMode<a id="sec-7-3-1" name="sec-7-3-1"></a>

## As programming IDE<a id="sec-7-4" name="sec-7-4"></a>

### project management<a id="sec-7-4-1" name="sec-7-4-1"></a>

#### projectile<a id="sec-7-4-1-1" name="sec-7-4-1-1"></a>

1.  Register for known project?

    -   0-9，total 10 registers
    -   C-u 0..9 C-c p p switch project and record to register
    -   C-u 0..9 followed by projectile commands to operate agaitest register recorded
        project

#### find-file-in-project<a id="sec-7-4-1-2" name="sec-7-4-1-2"></a>

### pair wrapping<a id="sec-7-4-2" name="sec-7-4-2"></a>

-   smartparens
-   wrap-region
-   autopair

### comment management<a id="sec-7-4-3" name="sec-7-4-3"></a>

## As elisp IDE<a id="sec-7-5" name="sec-7-5"></a>

### paredit<a id="sec-7-5-1" name="sec-7-5-1"></a>

### emacs-lisp-mode<a id="sec-7-5-2" name="sec-7-5-2"></a>

### lisp-interaction-mode<a id="sec-7-5-3" name="sec-7-5-3"></a>

### cask<a id="sec-7-5-4" name="sec-7-5-4"></a>

### ecukes<a id="sec-7-5-5" name="sec-7-5-5"></a>

## As ruby IDE<a id="sec-7-6" name="sec-7-6"></a>

## As clojure IDE<a id="sec-7-7" name="sec-7-7"></a>

### clojure-mode<a id="sec-7-7-1" name="sec-7-7-1"></a>

### cider<a id="sec-7-7-2" name="sec-7-7-2"></a>

## As C# IDE<a id="sec-7-8" name="sec-7-8"></a>

### csharp-mode<a id="sec-7-8-1" name="sec-7-8-1"></a>

### omnisharp-emacs<a id="sec-7-8-2" name="sec-7-8-2"></a>

## Dig into<a id="sec-7-9" name="sec-7-9"></a>

### [emacs source code](file://d:/HOME/memleaks/warehouse/projects/references/emacs/)<a id="sec-7-9-1" name="sec-7-9-1"></a>

#### TODO Build Emacs under Msys2 [reference](https://chriszheng.science/2015/03/19/Chinese-version-of-Emacs-building-guideline/)<a id="sec-7-9-1-1" name="sec-7-9-1-1"></a>

1.  Install Msys2 packages

    pacman -S base-devel mingw-w64-x86<sub>64</sub>-toolchain \\
    mingw-w64-x86<sub>64</sub>-xpm-nox mingw-w64-x86<sub>64</sub>-libtiff \\
    mingw-w64-x86<sub>64</sub>-giflib mingw-w64-x86<sub>64</sub>-libpng \\
    mingw-w64-x86<sub>64</sub>-libjpeg-turbo mingw-w64-x86<sub>64</sub>-librsvg \\
    mingw-w64-x86<sub>64</sub>-libxml2 mingw-w64-x86<sub>64</sub>-gnutls &#x2013;needed

2.  Run autogen

    ./autogen.sh

3.  Configure

    PKG<sub>CONFIG</sub><sub>PATH</sub>=/mingw64/lib/pkgconfig ./configure &#x2013;host=x86<sub>64</sub>-w64-mingw32 \\
    &#x2013;target=x86<sub>64</sub>-w64-mingw32 &#x2013;build=x86<sub>64</sub>-w64-mingw32 &#x2013;prefix=/usr/bin &#x2013;with-wide-int \\
    &#x2013;with-jpeg &#x2013;with-xpm &#x2013;with-png &#x2013;with-tiff &#x2013;with-rsvg &#x2013;with-xml2 \\
    &#x2013;with-gnutls &#x2013;without-imagemagick

4.  Make

    make && make install

5.  progress

    configure failure: no socklen<sub>t</sub>

### how emacs key binding works<a id="sec-7-9-2" name="sec-7-9-2"></a>

-   [notes](file://d:/HOME/memleaks/.emacs.d/notes/keymap.md) after reading emacs lisp manual

### find key binding's original and current value in all minor/major modes<a id="sec-7-9-3" name="sec-7-9-3"></a>
