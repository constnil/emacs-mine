<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Preface</a></li>
<li><a href="#sec-2">2. Personal information</a></li>
<li><a href="#sec-3">3. Setup load paths</a></li>
<li><a href="#sec-4">4. Package Setup</a>
<ul>
<li><a href="#sec-4-1">4.1. package.el</a></li>
<li><a href="#sec-4-2">4.2. use-package</a></li>
</ul>
</li>
<li><a href="#sec-5">5. Default Setup</a>
<ul>
<li><a href="#sec-5-1">5.1. better-defaults</a></li>
<li><a href="#sec-5-2">5.2. emacs apperence</a></li>
<li><a href="#sec-5-3">5.3. My defaults</a></li>
</ul>
</li>
<li><a href="#sec-6">6. Custom prefix keymap</a></li>
<li><a href="#sec-7">7. Orgmode</a>
<ul>
<li><a href="#sec-7-1">7.1. Perfered settings</a></li>
<li><a href="#sec-7-2">7.2. Keywords for todo tasks</a></li>
<li><a href="#sec-7-3">7.3. Bindings</a></li>
</ul>
</li>
<li><a href="#sec-8">8. Global bindings</a>
<ul>
<li><a href="#sec-8-1">8.1. buffer bindings</a></li>
<li><a href="#sec-8-2">8.2. window bindings</a>
<ul>
<li><a href="#sec-8-2-1">8.2.1. Thoughts</a></li>
<li><a href="#sec-8-2-2">8.2.2. Binding</a></li>
</ul>
</li>
<li><a href="#sec-8-3">8.3. navigation bindings</a></li>
<li><a href="#sec-8-4">8.4. search and replace bindings</a></li>
<li><a href="#sec-8-5">8.5. other bindings</a></li>
</ul>
</li>
<li><a href="#sec-9">9. Essential packages</a>
<ul>
<li><a href="#sec-9-1">9.1. undo-tree</a></li>
<li><a href="#sec-9-2">9.2. smex</a></li>
<li><a href="#sec-9-3">9.3. company</a></li>
<li><a href="#sec-9-4">9.4. ido related</a></li>
</ul>
</li>
<li><a href="#sec-10">10. Useful handy packages</a></li>
<li><a href="#sec-11">11. Evil-mode</a>
<ul>
<li><a href="#sec-11-1">11.1. Features &amp; thoughts</a></li>
<li><a href="#sec-11-2">11.2. Evil setup</a></li>
</ul>
</li>
<li><a href="#sec-12">12. Coding setup</a>
<ul>
<li><a href="#sec-12-1">12.1. Syntax Check</a></li>
<li><a href="#sec-12-2">12.2. Templating</a></li>
<li><a href="#paredit">12.3. Lisp coding setup</a>
<ul>
<li><a href="#sec-12-3-1">12.3.1. clojure</a></li>
<li><a href="#sec-12-3-2">12.3.2. common lisp</a></li>
<li><a href="#sec-12-3-3">12.3.3. paredit</a></li>
<li><a href="#sec-12-3-4">12.3.4. emacs-lisp</a></li>
</ul>
</li>
<li><a href="#sec-12-4">12.4. Ruby coding setup</a></li>
<li><a href="#sec-12-5">12.5. C# coding setup</a></li>
<li><a href="#sec-12-6">12.6. Common coding setup</a></li>
</ul>
</li>
<li><a href="#sec-13">13. Project management</a>
<ul>
<li><a href="#sec-13-1">13.1. projectile</a></li>
<li><a href="#sec-13-2">13.2. find-file-in-project</a></li>
</ul>
</li>
<li><a href="#sec-14">14. Misc setup</a></li>
<li><a href="#sec-15">15. Emacs server</a></li>
</ul>
</div>
</div>


# Preface<a id="sec-1" name="sec-1"></a>

OK, the following configuration not **simple** at all, but I'm trying
achieve this goal as I'm getting more comfortable with emacs.

Also, I'm trying to make KESS work as I expect on all my OSs:
-   Win7/Win10 (chocolatey emacs package, tried compile emacs on msys2,
    but no success)
-   Debian/Ubuntu (apt-get emacs package)
-   Arch Linux (pacman emacs package)

# Personal information<a id="sec-2" name="sec-2"></a>

I'm doing this because [Sacha Chua](https://github.com/sachac) doing this. I got this [org-babel config](https://github.com/sachac/.emacs.d) idea
from her [amazing blog](http://sachachua.com/blog/). Thanks Sacha!

    (setq user-full-name "Tiefeng Wu"
          user-mail-address "icebergwtf@qq.com")

# Setup load paths<a id="sec-3" name="sec-3"></a>

No custom load-path for now&#x2026;

    ;; (add-to-list 'load-path (concat user-emacs-directory "/lisp"))

# Package Setup<a id="sec-4" name="sec-4"></a>

## package.el<a id="sec-4-1" name="sec-4-1"></a>

Setup archive lists and initialize package.el

    ;; package.el setup
    (let ((archives
           '((       "melpa" . "http://melpa.org/packages/")
             ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
             (   "marmalade" . "http://marmalade-repo.org/packages/")
             (         "org" . "http://orgmode.org/elpa/"))))
      (when (< emacs-major-version 24)
        (add-to-list 'archives '("gnu" . "http://elpa.gnu.org/packages/")))
      (dolist (arch archives)
        (add-to-list 'package-archives arch)))
    (package-initialize)

## use-package<a id="sec-4-2" name="sec-4-2"></a>

[use-package](https://github.com/jwiegley/use-package) is very handy for package management, also I use bind-key to define
my own key bindings.

    ;; use-package setup
    (unless (package-installed-p 'use-package)
      (unless (assoc 'use-package package-archive-contents)
        (package-refresh-contents))
      (package-install 'use-package))
    
    (eval-when-compile
      (require 'use-package)
      (setq use-package-always-ensure t
            use-package-verbose t))
    
    ;; packages that use-package recommend
    (use-package diminish)
    (use-package bind-key
      :bind* (("C-`" . describe-personal-keybindings)))

# Default Setup<a id="sec-5" name="sec-5"></a>

## better-defaults<a id="sec-5-1" name="sec-5-1"></a>

Use [better-defaults](https://github.com/technomancy/better-defaults) package as start point

    (use-package better-defaults)

## emacs apperence<a id="sec-5-2" name="sec-5-2"></a>

Load faviorite theme, and since I'm still an emacs newbie, I perfer to enable
menu bar under GUI mode, whenever I'm getting lost, menu bar come for rescue.

    (load-theme 'tango-dark)
    (when window-system
      (menu-bar-mode 1)
      (if (equal system-type 'windows-nt)
          (add-hook 'after-init-hook 'toggle-frame-maximized)
        (add-hook 'after-init-hook 'toggle-frame-fullscreen)))

## My defaults<a id="sec-5-3" name="sec-5-3"></a>

My perfered settings.

    (setq-default tab-width 4
                  indent-tabs-mode nil
                  show-trailing-whitespace t)
    
    (setq gc-cons-threshold 20000000
          gdb-many-windows t
          highlight-nonselected-windows t
          inhibit-startup-screen t
          linum-format "%4d"
          scroll-conservatively 9999
          scroll-margin 5
          scroll-step 1
          system-time-locale "C"
          tramp-default-method "ssh"
          diff-switches "-u"
          split-width-threshold 120
          split-height-threshold 40)
    
    (winner-mode 1)
    (show-paren-mode 1)
    (recentf-mode 1)
    (global-linum-mode 1)
    (column-number-mode 1)

# Custom prefix keymap<a id="sec-6" name="sec-6"></a>

To not mess up with emacs's own prefix maps, my custom prefix binding use C-\\,
which I think very easy to reach.

    ;; C-\ prefix map for nearly all my custom bindings, to not mess up
    ;; default or other installed package's bindings
    (define-prefix-command 'kess-prefix-map)
    (bind-key* (kbd "C-\\") kess-prefix-map)
    (bind-keys :map kess-prefix-map
               ("C-\\" . set-mark-command)
               ("\\" . other-frame)
               ("0" . delete-frame)
               ("," . winner-undo)
               ("." . winner-redo)
               ("r" . comment-region)
               ("u" . uncomment-region))

# Orgmode<a id="sec-7" name="sec-7"></a>

## Perfered settings<a id="sec-7-1" name="sec-7-1"></a>

    (setq org-catch-invisible-edits 'smart
          org-completion-use-ido t
          org-ctrl-k-protect-subtree t
          org-enforce-todo-checkbox-dependencies t
          org-enforce-todo-dependencies t
          org-log-done 'time
          org-return-follows-link t
          org-special-ctrl-a/e t
          org-special-ctrl-k t
          org-special-ctrl-o t
          org-startup-indented t
          org-tags-column 0
          org-use-property-inheritance t)

## Keywords for todo tasks<a id="sec-7-2" name="sec-7-2"></a>

    (setq org-todo-keywords
          '((sequence "TODO(t)" "|" "DONE(d)")
            (sequence "OPEN(o)" "INSPECT(i)" "|" "FIXED(f)" "CLOSED(c)" "WONTFIX(w)" "NOREPROD(n)")
            (sequence "QUESTION(q) | ANSWERED(a)")))

## Bindings<a id="sec-7-3" name="sec-7-3"></a>

    (bind-keys :map kess-prefix-map
               ("<tab>" . org-force-cycle-archived)
               ("a" . org-archive-to-archive-sibling)
               :map org-mode-map
               ("M-n" . org-forward-heading-same-level)
               ("M-p" . org-backward-heading-same-level))
    ;; org-mode global bindings
    (bind-keys* ("C-c a" . org-agenda)
                ("C-c b" . org-iswitchb)
                ("C-c c" . org-capture)
                ("C-c l" . org-store-link)
                ("C-c t" . org-tags-view))

# Global bindings<a id="sec-8" name="sec-8"></a>

## buffer bindings<a id="sec-8-1" name="sec-8-1"></a>

    (bind-keys* ("M-`" . (lambda () (interactive) (kill-buffer (get-buffer (buffer-name)))))
                ("C-x S" . write-file)
                ("C-S-s" . save-some-buffers))
    
    (defun kess-switch-buffer (next)
      "Switch to non *[buffer]* buffer, use next-buffer when NEXT is t,
      otherwise, previous-buffer. (idea from stackoverflow)"
      (let ((bread-crumb (buffer-name))
            (fn (or (and next 'next-buffer) 'previous-buffer))
            (allowed-buffers '("*scratch*" "*info*" "*eshell*")))
        (funcall fn)
        (while (and (not (equal bread-crumb (buffer-name)))
                    (and (not (member (buffer-name) allowed-buffers))
                         (string-match-p "^\*.*\*$" (buffer-name))))
          (funcall fn))))
    
    (bind-keys*
     ("<C-tab>" . (lambda () (interactive) (kess-switch-buffer t)))
     ("<C-S-tab>" . (lambda () (interactive) (kess-switch-buffer nil)))
     ("<C-iso-lefttab>" . (lambda () (interactive) (kess-switch-buffer t)))
     ("<C-S-iso-lefttab>" . (lambda () (interactive) (kess-switch-buffer nil))))
    
    (defun kess-indent-buffer ()
      "Indent whole buffer."
      (interactive)
      (indent-region (point-min) (point-max) nil))
    
    ;; Ctrl+Alt+Shift+\ indent whole buffer
    (bind-key* (kbd "C-M-|") 'kess-indent-buffer)

## window bindings<a id="sec-8-2" name="sec-8-2"></a>

### Thoughts<a id="sec-8-2-1" name="sec-8-2-1"></a>

In old Turbo C/Pascal code editor has a window size edit behavior. C-F5 start
change window size, then use S-left, S-Right, S-Up and S-Down to change current
window respect to the direction, press Enter to accept and leave size change
mode. Maybe write a minor mode to provide this?

### Binding<a id="sec-8-2-2" name="sec-8-2-2"></a>

    (bind-keys* ("C-M-." . scroll-other-window)
                ("C-M-," . scroll-other-window-down)
                ("C-M-h" . windmove-left)
                ("C-M-j" . windmove-down)
                ("C-M-k" . windmove-up)
                ("C-M-l" . windmove-right))

## navigation bindings<a id="sec-8-3" name="sec-8-3"></a>

    (bind-keys ("M-n" . forward-paragraph)
               ("M-p" . backward-paragraph))

## search and replace bindings<a id="sec-8-4" name="sec-8-4"></a>

    (bind-keys* ("C-M-/" . query-replace)
                ("C-M-?" . query-replace-regexp))

## other bindings<a id="sec-8-5" name="sec-8-5"></a>

    (bind-keys* ("<backspace>" . delete-backward-char)
                ("M-\\" . hippie-expand)
                ("C-S-g" . occur))

# Essential packages<a id="sec-9" name="sec-9"></a>

These're packages I think is essential.

## undo-tree<a id="sec-9-1" name="sec-9-1"></a>

    (use-package undo-tree
      :bind* (("C-z" . undo-tree-undo)
              ("C-/" . undo-tree-redo))
      :config
      (global-undo-tree-mode))

## smex<a id="sec-9-2" name="sec-9-2"></a>

    (use-package smex
      :bind* (("M-x" . smex)
              ("M-X" . execute-extended-command)
              :map kess-prefix-map
              ("M-x" . smex-major-mode-commands)))

## company<a id="sec-9-3" name="sec-9-3"></a>

    (use-package company
      :diminish company-mode
      :demand
      :bind (:map company-active-map
                  ("M-n" . company-next-page)
                  ("M-p" . company-previous-page)
                  ("C-n" . company-select-next-or-abort)
                  ("C-p" . company-select-previous-or-abort))
      :config
      (setq company-idle-delay 0.3
            company-tooltip-limit 12
            company-minimum-prefix-length 2)
      (global-company-mode 1))

## ido related<a id="sec-9-4" name="sec-9-4"></a>

    (ido-mode 1)
    (ido-everywhere 1)
    
    (use-package ido-ubiquitous
      :config
      (ido-ubiquitous-mode 1))
    
    (use-package flx-ido
      :config
      (setq ido-enable-prefix nil
            ido-enable-flex-matching t
            ido-use-faces nil
            ido-create-new-buffer 'always
            ido-use-filename-at-point 'guess
            ido-max-prospects 10
            ido-default-file-method 'selected-window
            ido-auto-merge-work-directories-length -1)
      (flx-ido-mode 1))

# Useful handy packages<a id="sec-10" name="sec-10"></a>

In order to be KESS, I'll only choose some little packages besides essential
packages loaded above.

    (use-package popwin
      :config
      (popwin-mode 1))
    (use-package ag)
    (use-package ack)
    (use-package bookmark+)
    (use-package dtrt-indent
      :config
      (dtrt-indent-mode 1))

# Evil-mode<a id="sec-11" name="sec-11"></a>

Maybe I can totally discard later?  And I'm think about create a minor mode like
[god-mode](https://github.com/chrisdone/god-mode) and evil-mode, but just a thin layer to provide vim's normal state and
visual state. `Of course, this will be a tough task for me now.`

## Features & thoughts<a id="sec-11-1" name="sec-11-1"></a>

-   use CapsLock to switch
-   insert state as pure emacs
-   normal state + visual state = view state (or browse state?)

## Evil setup<a id="sec-11-2" name="sec-11-2"></a>

    (use-package evil
      :diminish undo-tree-mode
      :bind* (("C-:" . evil-ex)
              :map kess-prefix-map ("ESC" . evil-mode))
      :config
      (use-package powerline-evil
        :config
        (powerline-evil-vim-color-theme)
        (display-time-mode t))
    
      (unbind-key "C-z" evil-normal-state-map)
      (unbind-key "C-z" evil-motion-state-map)
      (unbind-key "C-z" evil-insert-state-map)
    
      ;; (setq evil-emacs-state-cursor '("red" box))
      ;; (setq evil-normal-state-cursor '("green" box))
      ;; (setq evil-visual-state-cursor '("orange" box))
      ;; (setq evil-insert-state-cursor '("red" bar))
      ;; (setq evil-replace-state-cursor '("red" bar))
      ;; (setq evil-operator-state-cursor '("red" hollow))
    
      (setq evil-esc-delay 0)
    
      (use-package evil-visualstar
        :config
        (global-evil-visualstar-mode t))
    
      (use-package evil-numbers
        :bind (:map evil-normal-state-map
                    ("+" . evil-numbers/inc-at-pt)
                    ("-" . evil-numbers/dec-at-pt)))
    
      (use-package evil-search-highlight-persist
        :bind (:map kess-prefix-map ("/" . evil-search-highlight-persist-remove-all))
        :config
        (global-evil-search-highlight-persist t))
    
      (use-package evil-leader
        :config
        (setq evil-leader/in-all-states 1)
        (evil-leader/set-leader ",")
        (global-evil-leader-mode)
        (evil-leader/set-key "/" 'evil-search-highlight-persist-remove-all)))

# Coding setup<a id="sec-12" name="sec-12"></a>

## Syntax Check<a id="sec-12-1" name="sec-12-1"></a>

Flycheck is a bit annoying when enabled globally, so I use it only when needed.

    (use-package flycheck
      :diminish flycheck-mode
      :bind (:map kess-prefix-map
                  ("f" . flycheck-mode))
      :config
      (use-package flycheck-pos-tip)
      (when (display-graphic-p (selected-frame))
        (eval-after-load 'flycheck
          '(custom-set-variables
            '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))))

## Templating<a id="sec-12-2" name="sec-12-2"></a>

Learn more and get used to it.

    (use-package yasnippet
      :diminish yas-minor-mode
      :config
      (setq yas-snippet-dirs (concat user-emacs-directory "snippets"))
      (yas-global-mode 1))

## Lisp coding setup<a id="paredit" name="paredit"></a>


    (defun add-lisp-hook (func)
      (dolist (x '(scheme emacs-lisp lisp clojure lisp-interaction slime-repl cider-repl))
        (add-hook (intern (concat (symbol-name x) "-mode-hook")) func)))

### clojure<a id="sec-12-3-1" name="sec-12-3-1"></a>

    (use-package clojure-mode :defer t)
    (use-package cider :defer t)

### common lisp<a id="sec-12-3-2" name="sec-12-3-2"></a>

    (load (expand-file-name "~/quicklisp/slime-helper.el"))
    (setq inferior-lisp-program "sbcl")

### paredit<a id="sec-12-3-3" name="sec-12-3-3"></a>

    (use-package paredit
      :demand
      :bind (:map paredit-mode-map
                  ("C-." . paredit-forward-slurp-sexp)
                  ("C-," . paredit-forward-barf-sexp)
                  ("C-\>" . paredit-backward-barf-sexp)
                  ("C-\<" . paredit-backward-slurp-sexp))
      :config
      (add-lisp-hook 'enable-paredit-mode))

### emacs-lisp<a id="sec-12-3-4" name="sec-12-3-4"></a>

    (use-package eldoc
      :diminish eldoc-mode
      :config
      (eldoc-add-command 'paredit-backward-delete 'paredit-close-round)
      (add-lisp-hook (lambda () (eldoc-mode 1))))

## Ruby coding setup<a id="sec-12-4" name="sec-12-4"></a>

    (use-package robe
      :config
      ;; (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
      ;;   (rvm-activate-corresponding-ruby))
      (add-hook 'robe-mode-hook 'ac-robe-setup)
      (add-hook 'ruby-mode-hook 'robe-mode)
      (eval-after-load 'company  '(push 'company-robe company-backends)))

## C# coding setup<a id="sec-12-5" name="sec-12-5"></a>

More dig into omnisharp-emacs.

    (use-package csharp-mode)
    (use-package omnisharp
      :config
      (setq omnisharp-server-executable-path "~/bin/omnisharp/OmniSharp")
      (when (file-exists-p omnisharp-server-executable-path)
        (add-hook 'csharp-mode-hook 'omnisharp-mode)
        (add-to-list 'company-backends 'company-omnisharp)))

## Common coding setup<a id="sec-12-6" name="sec-12-6"></a>

    (use-package rainbow-delimiters
      :config
      (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
      (add-lisp-hook 'rainbow-delimiters-mode))
    
    (use-package color-identifiers-mode
      :config
      (global-color-identifiers-mode))

# Project management<a id="sec-13" name="sec-13"></a>

Just start to use them, maybe one of both is enough? Or maybe a wrapper package
to benefit from both? (Another tough task)

## projectile<a id="sec-13-1" name="sec-13-1"></a>

    (use-package projectile
      :demand
      :bind* (("M-o" . projectile-find-file-dwim)
              ("M-O" . projectile-find-file-dwim-other-window))
      :config
      (projectile-global-mode)
      (setq projectile-indexing-method 'alien
            projectile-enable-caching t))

## find-file-in-project<a id="sec-13-2" name="sec-13-2"></a>

    (use-package find-file-in-project
      :ensure ivy)

# Misc setup<a id="sec-14" name="sec-14"></a>

    ;; savehist
    (savehist-mode t)
    (setq savehist-file (concat user-emacs-directory "savehist"))

# Emacs server<a id="sec-15" name="sec-15"></a>

Start server if not already running. Properly set server to work on MSWin is
painful.

    (require 'server)
    (when (not (eq (server-running-p) t))
      (add-hook 'after-init-hook 'server-start))
