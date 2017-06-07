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
</ul>
</li>
<li><a href="#sec-6">6. My defaults</a></li>
<li><a href="#sec-7">7. Essential packages</a>
<ul>
<li><a href="#sec-7-1">7.1. undo-tree</a></li>
<li><a href="#sec-7-2">7.2. company</a></li>
<li><a href="#sec-7-3">7.3. ido</a></li>
<li><a href="#sec-7-4">7.4. ivy</a></li>
</ul>
</li>
<li><a href="#sec-8">8. Useful packages</a></li>
<li><a href="#sec-9">9. Evil-mode</a></li>
<li><a href="#sec-10">10. Coding setup</a>
<ul>
<li><a href="#sec-10-1">10.1. Syntax Check</a></li>
<li><a href="#sec-10-2">10.2. Templating</a></li>
<li><a href="#paredit">10.3. Lisp coding setup</a>
<ul>
<li><a href="#sec-10-3-1">10.3.1. clojure</a></li>
<li><a href="#sec-10-3-2">10.3.2. common lisp</a></li>
<li><a href="#sec-10-3-3">10.3.3. paredit</a></li>
<li><a href="#sec-10-3-4">10.3.4. emacs-lisp</a></li>
</ul>
</li>
<li><a href="#sec-10-4">10.4. Ruby coding setup</a></li>
<li><a href="#sec-10-5">10.5. C# coding setup</a></li>
<li><a href="#sec-10-6">10.6. Common coding setup</a></li>
</ul>
</li>
<li><a href="#sec-11">11. Project management</a>
<ul>
<li><a href="#sec-11-1">11.1. projectile</a></li>
<li><a href="#sec-11-2">11.2. find-file-in-project</a></li>
</ul>
</li>
<li><a href="#sec-12">12. Emacs server</a></li>
<li><a href="#sec-13">13. Custom prefix keymap</a></li>
<li><a href="#sec-14">14. Global bindings</a>
<ul>
<li><a href="#sec-14-1">14.1. Utility functions</a></li>
<li><a href="#sec-14-2">14.2. Bindings</a></li>
</ul>
</li>
</ul>
</div>
</div>


# Preface<a id="sec-1" name="sec-1"></a>

OK, the following configuration as **simple** as promised, but I'm trying
achieve this goal as I'm getting more comfortable with emacs.

Also, I'm trying to make KESS work as I expect on all my OSs:
-   Win7/Win10 (chocolatey emacs package)
-   Debian/Ubuntu (apt-get emacs package)
-   Arch Linux (pacman emacs package)

# Personal information<a id="sec-2" name="sec-2"></a>

I got this [org-babel config](https://github.com/sachac/.emacs.d) idea from [Sacha Chua](https://github.com/sachac) and her [amazing blog](http://sachachua.com/blog/).
Thanks Sacha!

    (setq user-full-name "Tiefeng Wu"
          user-mail-address "icebergwtf@qq.com")

# Setup load paths<a id="sec-3" name="sec-3"></a>

No custom load-path for now&#x2026;

    (let ((home-lib-path (expand-file-name "~/.elisp/")))
      (when (file-directory-p home-lib-path)
        (add-to-list 'load-path home-lib-path)
        (load (concat home-lib-path "init.el") 'noerror)))
    
    (add-to-list 'load-path (concat user-emacs-directory "lisp/"))

# Package Setup<a id="sec-4" name="sec-4"></a>

## package.el<a id="sec-4-1" name="sec-4-1"></a>

Setup archive lists and initialize package.el

    ;; package.el setup
    ;; helper functions
    (defun kess/add-to-package-archives (name url &optional overwrite append)
      (if (assoc name package-archives)
          (when overwrite
            (setcdr (assoc name package-archives) url))
        (add-to-list 'package-archives (cons name url) append)))
    
    (defun kess/insert-to-package-archives (name url &optional overwrite)
      (kess/add-to-package-archives name url overwrite))
    
    (defun kess/append-to-package-archives (name url &optional overwrite)
      (kess/add-to-package-archives name url overwrite 'append))
    
    ;; add archives to package-archives, if not exist
    (kess/append-to-package-archives "gnu" "http://elpa.gnu.org/packages/")
    (kess/append-to-package-archives "org" "http://orgmode.org/elpa/")
    
    (if (and (memq system-type '(windows-nt ms-dos))
             (not (gnutls-available-p)))
        (kess/append-to-package-archives "melpa" "http://melpa.org/packages/")
      (progn
        (kess/append-to-package-archives "melpa" "https://melpa.org/packages/")
        (kess/append-to-package-archives "gnu" "https://elpa.gnu.org/packages/" 'overwrite)))
    
    (kess/append-to-package-archives "marmalade" "http://marmalade-repo.org/packages/")
    
    (setq package-enable-at-startup nil)
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
    (use-package bind-key)

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

# My defaults<a id="sec-6" name="sec-6"></a>

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
          split-height-threshold 40
          savehist-file (concat user-emacs-directory "savehist"))
    
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
          org-use-property-inheritance t)
    
    (setq org-todo-keywords
          '((sequence "TODO(t)" "|" "DONE(d)")
            (sequence "OPEN(o)" "INSPECT(i)" "|" "FIXED(f)" "CLOSED(c)" "WONTFIX(w)" "NOREPROD(n)")
            (sequence "QUESTION(q) | ANSWERED(a)")))
    
    (bind-keys :map org-mode-map
               ("M-n" . org-forward-heading-same-level)
               ("M-p" . org-backward-heading-same-level))
    
    (winner-mode 1)
    (show-paren-mode 1)
    (recentf-mode 1)
    (global-linum-mode 1)
    (column-number-mode 1)
    (savehist-mode 1)

# Essential packages<a id="sec-7" name="sec-7"></a>

These're packages I think is essential.

## undo-tree<a id="sec-7-1" name="sec-7-1"></a>

    (use-package undo-tree :config (global-undo-tree-mode))

## company<a id="sec-7-2" name="sec-7-2"></a>

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

## ido<a id="sec-7-3" name="sec-7-3"></a>

    (use-package ido-ubiquitous :defer t)
    
    (use-package flx-ido
      :defer t
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

## ivy<a id="sec-7-4" name="sec-7-4"></a>

    (use-package ivy
      :demand
      :ensure counsel
      :diminish ivy-mode
      :bind (:map ivy-minibuffer-map
                  ("C-j" . ivy-immediate-done)
                  ("RET" . ivy-alt-done))
      :bind (:map read-expression-map
                  ("C-r" . counsel-expression-history))
      :config
      (add-hook 'after-init-hook
                (lambda ()
                  (when (bound-and-true-p ido-ubiquitous-mode)
                    (ido-ubiquitous-mode -1))
                  (when (bound-and-true-p ido-mode)
                    (ido-mode -1))
                  (ivy-mode 1)))
    
      (setq-default ivy-use-virtual-buffers t
                    ivy-count-format ""
                    ivy-initial-inputs-alist '((man . "^") (woman . "^"))
                    projectile-completion-system 'ivy)
      (setq ivy-use-virtual-buffers t
            enable-recursive-minibuffers t)
    
      (use-package flx
        :config
        (setq-default ivy-re-builders-alist '((t . ivy--regex-fuzzy))))
    
      (use-package ivy-historian
        :config
        (add-hook 'after-init-hook (lambda () (ivy-historian-mode t)))))

# Useful packages<a id="sec-8" name="sec-8"></a>

In order to be KESS, these're packages besides essential packages
loaded above.

    (use-package ag :defer t)
    (use-package ack :defer t)
    (use-package bookmark+ :defer t)
    (use-package cl-lib :config (require 'cl-lib))
    (use-package dtrt-indent :config (dtrt-indent-mode 1))
    (use-package fullframe :config (fullframe list-packages quit-window))
    (use-package smex :defer t)
    (use-package popwin :config (popwin-mode 1))

# Evil-mode<a id="sec-9" name="sec-9"></a>

Maybe I can totally discard later?  And I'm think about create a minor mode like
[god-mode](https://github.com/chrisdone/god-mode) and evil-mode, but just a thin layer to provide vim's normal state and
visual state. `Of course, this will be a tough task for me now.`

    (use-package evil
      :diminish undo-tree-mode
      :bind* (("C-:" . evil-ex))
      :config
      (use-package powerline-evil
        :config
        (powerline-evil-vim-color-theme)
        (display-time-mode t))
    
      (unbind-key "C-z" evil-normal-state-map)
      (unbind-key "C-z" evil-motion-state-map)
      (unbind-key "C-z" evil-insert-state-map)
    
      (setq evil-esc-delay 0)
    
      (use-package evil-visualstar
        :config
        (global-evil-visualstar-mode t))
    
      (use-package evil-numbers
        :bind (:map evil-normal-state-map
                    ("+" . evil-numbers/inc-at-pt)
                    ("-" . evil-numbers/dec-at-pt)))
    
      (use-package evil-search-highlight-persist
        :config
        (global-evil-search-highlight-persist t))
    
      (use-package evil-leader
        :config
        (setq evil-leader/in-all-states 1)
        (evil-leader/set-leader ",")
        (global-evil-leader-mode)
        (evil-leader/set-key "/" 'evil-search-highlight-persist-remove-all)))

# Coding setup<a id="sec-10" name="sec-10"></a>

## Syntax Check<a id="sec-10-1" name="sec-10-1"></a>

    (use-package flycheck
      :defer t
      :diminish flycheck-mode
      :config
      (use-package flycheck-pos-tip)
      (when (display-graphic-p (selected-frame))
        (eval-after-load 'flycheck
          '(custom-set-variables
            '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))))

## Templating<a id="sec-10-2" name="sec-10-2"></a>

Learn more and get used to it.

    (use-package yasnippet
      :defer t
      :diminish yas-minor-mode
      :config
      (setq yas-snippet-dirs (concat user-emacs-directory "snippets"))
      (yas-global-mode 1))

## Lisp coding setup<a id="paredit" name="paredit"></a>


    (defun add-lisp-hook (func)
      (dolist (x '(scheme emacs-lisp lisp clojure lisp-interaction slime-repl cider-repl))
        (add-hook (intern (concat (symbol-name x) "-mode-hook")) func)))

### clojure<a id="sec-10-3-1" name="sec-10-3-1"></a>

    (use-package clojure-mode :defer t)
    (use-package cider :defer t)

### common lisp<a id="sec-10-3-2" name="sec-10-3-2"></a>

    (load (expand-file-name "~/quicklisp/slime-helper.el"))
    (setq inferior-lisp-program "sbcl")

### paredit<a id="sec-10-3-3" name="sec-10-3-3"></a>

    (use-package paredit
      :demand
      :diminish paredit-mode
      :bind (:map paredit-mode-map
                  ("C-." . paredit-forward-slurp-sexp)
                  ("C-," . paredit-forward-barf-sexp)
                  ("C-\>" . paredit-backward-barf-sexp)
                  ("C-\<" . paredit-backward-slurp-sexp))
      :config
      (add-lisp-hook 'enable-paredit-mode))

### emacs-lisp<a id="sec-10-3-4" name="sec-10-3-4"></a>

    (add-to-list 'auto-mode-alist '("Cask"  . emacs-lisp-mode))
    
    (use-package eldoc
      :diminish eldoc-mode
      :config
      (eldoc-add-command 'paredit-backward-delete 'paredit-close-round)
      (add-lisp-hook (lambda () (eldoc-mode 1))))

## Ruby coding setup<a id="sec-10-4" name="sec-10-4"></a>

    (use-package ruby-mode
      :bind (:map ruby-mode-map
                  ("TAB" . indent-for-tab-command))
      :config
      (setq-default ruby-use-encoding-map nil
                    ruby-insert-encoding-magic-comment nil)
    
      (add-hook 'ruby-mode-hook
                (lambda ()
                  (unless (derived-mode-p 'prog-mode)
                    (run-hooks 'prog-mode-hook))))
      (add-hook 'ruby-mode-hook 'subword-mode)
    
      (use-package ruby-hash-syntax)
      (use-package ruby-compilation
        :config
        (defalias 'rake 'ruby-compilation-rake))
      (use-package inf-ruby)
      (use-package robe
        :config
        (eval-after-load 'company '(push 'company-robe company-backends))
        (add-hook 'robe-mode-hook 'ac-robe-setup)
        (add-hook 'ruby-mode-hook 'robe-mode))
    
      (use-package rspec-mode)
      (use-package yari
        :config
        (defalias 'ri 'yari))
      (use-package goto-gem)
      (use-package bundler)
      (use-package yaml-mode)
      (use-package mmm-mode
        :config
        (require 'mmm-erb)
        (require 'derived)
        (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
    
        (add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'"  . html-erb-mode))
        (mmm-add-mode-ext-class 'yaml-mode "\\.yaml\\(\\.erb\\)?\\'" 'erb)))

## C# coding setup<a id="sec-10-5" name="sec-10-5"></a>

More dig into omnisharp-emacs.

    (use-package csharp-mode :defer t)
    (use-package omnisharp
      :defer t
      :config
      (setq omnisharp-server-executable-path "~/bin/omnisharp/OmniSharp")
      (when (file-exists-p omnisharp-server-executable-path)
        (add-hook 'csharp-mode-hook 'omnisharp-mode)
        (add-to-list 'company-backends 'company-omnisharp)))

## Common coding setup<a id="sec-10-6" name="sec-10-6"></a>

    (use-package rainbow-delimiters
      :config
      (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
      (add-lisp-hook 'rainbow-delimiters-mode))
    
    (use-package color-identifiers-mode
      :diminish color-identifiers-mode
      :config
      (global-color-identifiers-mode))

# Project management<a id="sec-11" name="sec-11"></a>

Just start to use them, maybe one of both is enough? Or maybe a wrapper package
to benefit from both? (Another tough task)

## projectile<a id="sec-11-1" name="sec-11-1"></a>

    (use-package projectile
      :demand
      :config
      (projectile-global-mode)
      (setq projectile-indexing-method 'alien
            projectile-enable-caching t))

## find-file-in-project<a id="sec-11-2" name="sec-11-2"></a>

    (use-package find-file-in-project
      :demand
      :ensure ivy)

# Emacs server<a id="sec-12" name="sec-12"></a>

Start server if not already running. Properly set server to work on MSWin is
painful.

    (add-hook 'after-init-hook
              (lambda ()
                (require 'server)
                (unless (server-running-p)
                  (server-start))))

# Custom prefix keymap<a id="sec-13" name="sec-13"></a>

To not mess up with emacs's own and other package's prefix maps, my
custom prefix binding use C-\\, which I think very easy to reach.

    ;; C-\ prefix map for nearly all my custom bindings, to not mess up
    ;; default or other installed package's bindings
    (define-prefix-command 'kess-prefix-map)
    (bind-key* (kbd "C-\\") kess-prefix-map)
    (bind-keys :map kess-prefix-map
               ("0" . delete-frame)
    
               ("a" . counsel-ag)
               ("f" . flycheck-mode)
               ("g" . counsel-git)
               ("j" . counsel-git-grep)
               ("l" . counsel-locate)
               ("o" . counsel-rhythmbox)
               ("r" . ivy-resume)
               ("s" . swiper)
               ("z" . org-archive-to-archive-sibling)
    
               ("," . winner-undo)
               ("." . winner-redo)
               ("/" . comment-region)
               ("\\" . uncomment-region)
    
               ("C-." . describe-personal-keybindings)
               ("C-/" . evil-search-highlight-persist-remove-all)
               ("C-\\" . set-mark-command)
    
               ("M-x" . execute-extended-command)
               ("M-X" . smex-major-mode-commands)
    
               ("TAB" . org-force-cycle-archived)
               ("ESC" . evil-mode))

# Global bindings<a id="sec-14" name="sec-14"></a>

## Utility functions<a id="sec-14-1" name="sec-14-1"></a>

    (defun kess/switch-buffer (next)
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
    
    (defun kess/indent-buffer ()
      "Indent whole buffer."
      (interactive)
      (indent-region (point-min) (point-max) nil))

## Bindings<a id="sec-14-2" name="sec-14-2"></a>

    (bind-keys ("<backspace>" . delete-backward-char))
    
    (bind-keys* ("M-o" . find-file-in-project)
                ("M-x" . counsel-M-x)
                ("M-X" . smex)
                ("M-\\" . hippie-expand)
                ("M-`" . (lambda () (interactive) (kill-buffer (get-buffer (buffer-name)))))
    
                ("C-z" . undo-tree-undo)
                ("C-/" . undo-tree-redo)
                ("C-`" . swiper)
    
                ("C-x C-f" . counsel-find-file)
                ("C-x S" . write-file)
    
                ("C-S-g" . occur)
                ("C-S-s" . save-some-buffers)
    
                ("C-c a" . org-agenda)
                ("C-c b" . org-iswitchb)
                ("C-c c" . org-capture)
                ("C-c l" . org-store-link)
                ("C-c t" . org-tags-view)
    
                ("<C-tab>" . (lambda () (interactive) (kess/switch-buffer t)))
                ("<C-S-tab>" . (lambda () (interactive) (kess/switch-buffer nil)))
                ("<C-iso-lefttab>" . (lambda () (interactive) (kess/switch-buffer t)))
                ("<C-S-iso-lefttab>" . (lambda () (interactive) (kess/switch-buffer nil)))
    
                ("C-M-|" . kess/indent-buffer)
                ("C-M-." . scroll-other-window)
                ("C-M-," . scroll-other-window-down)
    
                ("C-M-h" . windmove-left)
                ("C-M-j" . windmove-down)
                ("C-M-k" . windmove-up)
                ("C-M-l" . windmove-right)
    
                ("C-M-/" . query-replace)
                ("C-M-?" . query-replace-regexp)
    
                ("C-h l" . counsel-find-library)
                ("C-h i" . counsel-info-lookup-symbol)
                ("C-h u" . counsel-unicode-char)
                ("C-h p" . describe-package)
    
                ("C-h C-l" . view-lossage)
                ("C-h C-i" . info)
                ("C-h C-p" . finder-by-keyword))
