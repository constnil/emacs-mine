<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Preface</a></li>
<li><a href="#sec-2">2. Suit Loading</a></li>
<li><a href="#sec-3">3. My custom aliases</a>
<ul>
<li><a href="#sec-3-1">3.1. Suit prefix aliases</a></li>
<li><a href="#sec-3-2">3.2. Emacs command aliases, they can be used follow above suit prefixes, like 'prelude emacw'</a></li>
</ul>
</li>
<li><a href="#sec-4">4. Suit management will not use submodule</a></li>
<li><a href="#sec-5">5. Use cask and ecukes for study purpose?</a></li>
<li><a href="#sec-6">6. Functions for emacs study?</a></li>
<li><a href="#sec-7">7. Change "mine" suit to "kess - Keep Emacs Simple, Stupid" suit</a></li>
<li><a href="#sec-8">8. Learning Plan</a>
<ul>
<li><a href="#sec-8-1">8.1. As text editor</a>
<ul>
<li><a href="#sec-8-1-1">8.1.1. global search (grep/ack/ag)</a></li>
<li><a href="#sec-8-1-2">8.1.2. open recent file</a></li>
</ul>
</li>
<li><a href="#sec-8-2">8.2. As system management tool</a>
<ul>
<li><a href="#sec-8-2-1">8.2.1. eshell-mode</a></li>
<li><a href="#sec-8-2-2">8.2.2. shell-mode</a></li>
<li><a href="#sec-8-2-3">8.2.3. term-mode</a></li>
<li><a href="#sec-8-2-4">8.2.4. package management</a>
<ul>
<li><a href="#sec-8-2-4-1">8.2.4.1. el-get</a></li>
<li><a href="#sec-8-2-4-2">8.2.4.2. package.el</a></li>
<li><a href="#sec-8-2-4-3">8.2.4.3. use-package</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-8-3">8.3. As personal task management tool</a>
<ul>
<li><a href="#sec-8-3-1">8.3.1. OrgMode</a></li>
</ul>
</li>
<li><a href="#sec-8-4">8.4. As programming IDE</a>
<ul>
<li><a href="#sec-8-4-1">8.4.1. project management</a>
<ul>
<li><a href="#sec-8-4-1-1">8.4.1.1. projectile</a></li>
<li><a href="#sec-8-4-1-2">8.4.1.2. find-file-in-project</a></li>
</ul>
</li>
<li><a href="#sec-8-4-2">8.4.2. pair wrapping</a></li>
<li><a href="#sec-8-4-3">8.4.3. comment management</a></li>
</ul>
</li>
<li><a href="#sec-8-5">8.5. As elisp IDE</a>
<ul>
<li><a href="#sec-8-5-1">8.5.1. paredit</a></li>
<li><a href="#sec-8-5-2">8.5.2. emacs-lisp-mode</a></li>
<li><a href="#sec-8-5-3">8.5.3. lisp-interaction-mode</a></li>
<li><a href="#sec-8-5-4">8.5.4. cask</a></li>
<li><a href="#sec-8-5-5">8.5.5. ecukes</a></li>
</ul>
</li>
<li><a href="#sec-8-6">8.6. As ruby IDE</a></li>
<li><a href="#sec-8-7">8.7. As clojure IDE</a>
<ul>
<li><a href="#sec-8-7-1">8.7.1. clojure-mode</a></li>
<li><a href="#sec-8-7-2">8.7.2. cider</a></li>
</ul>
</li>
<li><a href="#sec-8-8">8.8. As C# IDE</a>
<ul>
<li><a href="#sec-8-8-1">8.8.1. csharp-mode</a></li>
<li><a href="#sec-8-8-2">8.8.2. omnisharp-emacs</a></li>
</ul>
</li>
<li><a href="#sec-8-9">8.9. Dig into</a>
<ul>
<li><a href="#sec-8-9-1">8.9.1. emacs source code</a>
<ul>
<li><a href="#sec-8-9-1-1">8.9.1.1. <span class="todo TODO">TODO</span> Build Emacs under Msys2 reference</a></li>
</ul>
</li>
<li><a href="#sec-8-9-2">8.9.2. how emacs key binding works</a></li>
<li><a href="#sec-8-9-3">8.9.3. find key binding's original and current value in all minor/major modes</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-9">9. Thoughts</a>
<ul>
<li><a href="#sec-9-1">9.1. Preview for dired-mode</a></li>
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

# Suit Loading<a id="sec-2" name="sec-2"></a>

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
    (let* ((suits '("live" "prelude" "space" "bling" "sachac" "purcell" "kess"))
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
    
      (message "config suit \"%s\" loaded" suit))

# My custom aliases<a id="sec-3" name="sec-3"></a>

## Suit prefix aliases<a id="sec-3-1" name="sec-3-1"></a>

-   alias prelude='export EMACS<sub>CONFIG</sub>="prelude" && echo "launch emacs using config: $EMACS<sub>CONFIG</sub>" &&'
-   alias live='export EMACS<sub>CONFIG</sub>="live" && echo "launch emacs using config: $EMACS<sub>CONFIG</sub>" &&'
-   alias space='export EMACS<sub>CONFIG</sub>="space" && echo "launch emacs using config: $EMACS<sub>CONFIG</sub>" &&'
-   alias bling='export EMACS<sub>CONFIG</sub>="bling" && echo "launch emacs using config: $EMACS<sub>CONFIG</sub>" &&'
-   alias sachac='export EMACS<sub>CONFIG</sub>="sachac" && echo "launch emacs using config: $EMACS<sub>CONFIG</sub>" &&'
-   alias purcell='export EMACS<sub>CONFIG</sub>="purcell" && echo "launch emacs using config: $EMACS<sub>CONFIG</sub>" &&'
-   alias kess='export EMACS<sub>CONFIG</sub>="kess" && echo "launch emacs using config: $EMACS<sub>CONFIG</sub>" &&'

## Emacs command aliases, they can be used follow above suit prefixes, like 'prelude emacw'<a id="sec-3-2" name="sec-3-2"></a>

-   alias vanilla='emacs -nw -q'
-   alias emacn='emacs -nw'
-   alias emacd='emacs -nw &#x2013;debug-init'
-   alias emawd='emacs &#x2013;debug-init &'
-   alias emact='emacsclient -t'
-   alias emacw='emacsclient -c &'

# Suit management will not use submodule<a id="sec-4" name="sec-4"></a>

-   How to define suit? (name, repos location, &#x2026;)
-   Maybe not use environment variable too?
-   Which famous suits too include by default?

# Use cask and ecukes for study purpose?<a id="sec-5" name="sec-5"></a>

# Functions for emacs study?<a id="sec-6" name="sec-6"></a>

-   Insert command name by key press

# Change "mine" suit to "[kess - Keep Emacs Simple, Stupid](kess/kess.md)" suit<a id="sec-7" name="sec-7"></a>

-   [X] make kess as default
-   [X] C-\` prefix key map, mainly for mark related commands
-   [ ] C-backspace backward-delete-line
-   [ ] M-backspace backward-delete-word

# Learning Plan<a id="sec-8" name="sec-8"></a>

## As text editor<a id="sec-8-1" name="sec-8-1"></a>

### global search (grep/ack/ag)<a id="sec-8-1-1" name="sec-8-1-1"></a>

### open recent file<a id="sec-8-1-2" name="sec-8-1-2"></a>

## As system management tool<a id="sec-8-2" name="sec-8-2"></a>

### eshell-mode<a id="sec-8-2-1" name="sec-8-2-1"></a>

### shell-mode<a id="sec-8-2-2" name="sec-8-2-2"></a>

### term-mode<a id="sec-8-2-3" name="sec-8-2-3"></a>

### package management<a id="sec-8-2-4" name="sec-8-2-4"></a>

#### el-get<a id="sec-8-2-4-1" name="sec-8-2-4-1"></a>

#### package.el<a id="sec-8-2-4-2" name="sec-8-2-4-2"></a>

#### use-package<a id="sec-8-2-4-3" name="sec-8-2-4-3"></a>

## As personal task management tool<a id="sec-8-3" name="sec-8-3"></a>

### OrgMode<a id="sec-8-3-1" name="sec-8-3-1"></a>

## As programming IDE<a id="sec-8-4" name="sec-8-4"></a>

### project management<a id="sec-8-4-1" name="sec-8-4-1"></a>

#### projectile<a id="sec-8-4-1-1" name="sec-8-4-1-1"></a>

1.  Register for known project?

    -   0-9，total 10 registers
    -   C-u 0..9 C-c p p switch project and record to register
    -   C-u 0..9 followed by projectile commands to operate agaitest register recorded
        project

#### find-file-in-project<a id="sec-8-4-1-2" name="sec-8-4-1-2"></a>

### pair wrapping<a id="sec-8-4-2" name="sec-8-4-2"></a>

-   smartparens
-   wrap-region
-   autopair

### comment management<a id="sec-8-4-3" name="sec-8-4-3"></a>

## As elisp IDE<a id="sec-8-5" name="sec-8-5"></a>

### paredit<a id="sec-8-5-1" name="sec-8-5-1"></a>

### emacs-lisp-mode<a id="sec-8-5-2" name="sec-8-5-2"></a>

### lisp-interaction-mode<a id="sec-8-5-3" name="sec-8-5-3"></a>

### cask<a id="sec-8-5-4" name="sec-8-5-4"></a>

### ecukes<a id="sec-8-5-5" name="sec-8-5-5"></a>

## As ruby IDE<a id="sec-8-6" name="sec-8-6"></a>

## As clojure IDE<a id="sec-8-7" name="sec-8-7"></a>

### clojure-mode<a id="sec-8-7-1" name="sec-8-7-1"></a>

### cider<a id="sec-8-7-2" name="sec-8-7-2"></a>

## As C# IDE<a id="sec-8-8" name="sec-8-8"></a>

### csharp-mode<a id="sec-8-8-1" name="sec-8-8-1"></a>

### omnisharp-emacs<a id="sec-8-8-2" name="sec-8-8-2"></a>

## Dig into<a id="sec-8-9" name="sec-8-9"></a>

### [emacs source code](file:///home/constnil/warehouse/projects/references/emacs/)<a id="sec-8-9-1" name="sec-8-9-1"></a>

#### TODO Build Emacs under Msys2 [reference](https://chriszheng.science/2015/03/19/Chinese-version-of-Emacs-building-guideline/)<a id="sec-8-9-1-1" name="sec-8-9-1-1"></a>

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

### how emacs key binding works<a id="sec-8-9-2" name="sec-8-9-2"></a>

-   [notes](file:///home/constnil/.emacs.d/notes/keymap.md) after reading emacs lisp manual

### find key binding's original and current value in all minor/major modes<a id="sec-8-9-3" name="sec-8-9-3"></a>

# Thoughts<a id="sec-9" name="sec-9"></a>

## Preview for dired-mode<a id="sec-9-1" name="sec-9-1"></a>
