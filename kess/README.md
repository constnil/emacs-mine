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
<li><a href="#sec-5-2">5.2. my defaults</a></li>
<li><a href="#sec-5-3">5.3. emacs apperence</a></li>
</ul>
</li>
<li><a href="#sec-6">6. Essential packages</a>
<ul>
<li><a href="#sec-6-1">6.1. undo-tree</a></li>
<li><a href="#sec-6-2">6.2. company</a></li>
<li><a href="#sec-6-3">6.3. ido</a></li>
<li><a href="#sec-6-4">6.4. ivy</a></li>
</ul>
</li>
<li><a href="#sec-7">7. Useful packages</a></li>
<li><a href="#sec-8">8. Evil-mode</a></li>
<li><a href="#sec-9">9. Coding setup</a>
<ul>
<li><a href="#sec-9-1">9.1. Syntax Check</a></li>
<li><a href="#sec-9-2">9.2. Templating</a></li>
<li><a href="#paredit">9.3. Lisp coding setup</a>
<ul>
<li><a href="#sec-9-3-1">9.3.1. clojure</a></li>
<li><a href="#sec-9-3-2">9.3.2. common lisp</a></li>
<li><a href="#sec-9-3-3">9.3.3. paredit</a></li>
<li><a href="#sec-9-3-4">9.3.4. emacs-lisp</a></li>
</ul>
</li>
<li><a href="#sec-9-4">9.4. Ruby coding setup</a></li>
<li><a href="#sec-9-5">9.5. C# coding setup</a></li>
<li><a href="#sec-9-6">9.6. Common coding setup</a></li>
</ul>
</li>
<li><a href="#sec-10">10. Project management</a>
<ul>
<li><a href="#sec-10-1">10.1. projectile</a></li>
<li><a href="#sec-10-2">10.2. find-file-in-project</a></li>
<li><a href="#sec-10-3">10.3. find-file-in-repository</a></li>
</ul>
</li>
<li><a href="#sec-11">11. Emacs server</a></li>
<li><a href="#sec-12">12. Bindings</a>
<ul>
<li><a href="#sec-12-1">12.1. Utility functions</a></li>
<li><a href="#sec-12-2">12.2. Global bindings</a></li>
<li><a href="#sec-12-3">12.3. Mode-map bindings</a></li>
<li><a href="#sec-12-4">12.4. Custom prefix keymap</a></li>
</ul>
</li>
</ul>
</div>
</div>


# Preface<a id="sec-1" name="sec-1"></a>

OK, the following configuration as **simple** as promised, but I'm trying achieve
this goal as I'm getting more comfortable with emacs.

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

    (let ((home-lib-path (expand-file-name "~/.elisp/")))
      (when (file-directory-p home-lib-path)
        (add-to-list 'load-path home-lib-path)
        (load (concat home-lib-path "init.el") 'noerror)))

# Package Setup<a id="sec-4" name="sec-4"></a>

## package.el<a id="sec-4-1" name="sec-4-1"></a>

Setup archive lists and initialize package.el

    ;; package.el setup
    
    ;; helper functions
    (defun kess--add-to-package-archives (name url &optional overwrite append)
      (if (assoc name package-archives)
          (when overwrite
            (setcdr (assoc name package-archives) url))
        (add-to-list 'package-archives (cons name url) append)))
    
    (defun kess--insert-to-package-archives (name url &optional overwrite)
      (kess--add-to-package-archives name url overwrite))
    
    (defun kess--append-to-package-archives (name url &optional overwrite)
      (kess--add-to-package-archives name url overwrite 'append))
    
    ;; add archives to package-archives, if not exist
    (let* ((schema (or (and (gnutls-available-p)  "https://") "http://")))
      (kess--append-to-package-archives "gnu" (concat schema "elpa.gnu.org/packages/"))
      (kess--append-to-package-archives "melpa" (concat schema "melpa.org/packages/"))
      (kess--append-to-package-archives "marmalade" (concat schema "marmalade-repo.org/packages/")))
    
    (kess--append-to-package-archives "org" "http://orgmode.org/elpa/")
    
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

## my defaults<a id="sec-5-2" name="sec-5-2"></a>

    (setq-default tab-width 4
                  indent-tabs-mode nil
                  show-trailing-whitespace t)
    
    (setq inhibit-startup-screen t
          gc-cons-threshold 20000000
          gdb-many-windows t
          default-fill-column 80
          highlight-nonselected-windows t
          scroll-conservatively 9999
          scroll-margin 5
          scroll-step 1
          system-time-locale "C"
          tramp-default-method "ssh"
          diff-switches "-u"
          split-width-threshold 120
          split-height-threshold 40)
    
    (setq org-archive-mark-done nil
          org-catch-invisible-edits 'smart
          org-completion-use-ido t
          org-ctrl-k-protect-subtree t
          org-edit-timestamp-down-means-later t
          org-enforce-todo-checkbox-dependencies t
          org-enforce-todo-dependencies t
          org-export-coding-system 'utf-8
          org-export-kill-product-buffer-when-displayed t
          org-fast-tag-selection-single-key 'expert
          org-hide-emphasis-markers t
          org-html-validation-link nil
          org-log-done 'time
          org-return-follows-link t
          org-special-ctrl-a/e t
          org-special-ctrl-k t
          org-special-ctrl-o t
          org-use-speed-commands t
          org-startup-indented t
          org-support-shift-select t
          org-tags-column 80
          org-use-property-inheritance t)
    
    (winner-mode 1)
    (show-paren-mode 1)
    (recentf-mode 1)
    (column-number-mode 1)
    (savehist-mode 1)
    
    (setq display-time-24hr-format t
          display-time-day-and-date t)
    (display-time-mode 1)
    
    (setq linum-format "%4d")
    (global-linum-mode 1)
    
    (setq desktop-restore-frames nil
          desktop-restore-eager 10
          desktop-save t
          desktop-base-file-name "desktop"
          desktop-base-lock-name "desktop.lock"
          desktop-path (list user-emacs-directory)
          desktop-dirname user-emacs-directory
          desktop-load-locked-desktop nil)
    
    (setq frameset-filter-alist (copy-tree frameset-filter-alist))
    (let ((fullscreen (assoc 'fullscreen frameset-filter-alist))
          (gui-fullscreen (assoc 'GUI:fullscreen frameset-filter-alist))
          (never-fn (lambda (elt)
                      (if elt (setcdr elt :never)
                        (push (cons elt . :never) frameset-filter-alist)))))
      (funcall never-fn fullscreen)
      (funcall never-fn gui-fullscreen))
    
    (desktop-save-mode 1)

## emacs apperence<a id="sec-5-3" name="sec-5-3"></a>

Load faviorite theme, and since I'm still an emacs newbie, I perfer to enable
menu bar under GUI mode, whenever I'm getting lost, menu bar come for rescue.

    (load-theme 'tango-dark)
    (when window-system
      (menu-bar-mode 1)
      (add-hook 'after-init-hook
                (or (and (eq system-type 'windows-nt) 'toggle-frame-maximized)
                    'toggle-frame-fullscreen)))

# Essential packages<a id="sec-6" name="sec-6"></a>

These're packages I think is essential.

## undo-tree<a id="sec-6-1" name="sec-6-1"></a>

    (use-package undo-tree :config (global-undo-tree-mode))

## company<a id="sec-6-2" name="sec-6-2"></a>

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

## ido<a id="sec-6-3" name="sec-6-3"></a>

    (use-package ido-ubiquitous :defer t)
    
    (use-package flx-ido
      :defer t
      :config
      (setq ido-auto-merge-work-directories-length -1
            ido-create-new-buffer 'always
            ido-default-file-method 'selected-window
            ido-enable-flex-matching t
            ido-enable-prefix nil
            ido-max-prospects 10
            ido-use-faces nil
            ido-use-filename-at-point 'guess)
      (flx-ido-mode 1))

## ivy<a id="sec-6-4" name="sec-6-4"></a>

    (use-package ivy
      :demand
      :ensure counsel
      :diminish ivy-mode
      :bind (:map ivy-minibuffer-map
                  ("C-j" . ivy-immediate-done)
                  ("RET" . ivy-alt-done)
                  ("C-." . kess--cycle-ivy-regex-method))
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
    
      (use-package ivy-historian
        :config
        (add-hook 'after-init-hook (lambda () (ivy-historian-mode t))))
    
      (use-package flx))

# Useful packages<a id="sec-7" name="sec-7"></a>

In order to be KESS, these're packages besides essential packages loaded above.

    (use-package ag :defer t)
    (use-package ack :defer t)
    (use-package bookmark+ :defer t)
    (use-package cl-lib :config (require 'cl-lib))
    (use-package dtrt-indent
      :config
      (setq dtrt-indent-active-mode-line-info " [dtrt]")
      (dtrt-indent-mode 1))
    (use-package fullframe :config (fullframe list-packages quit-window))
    (use-package smex :defer t)
    (use-package popwin :config (popwin-mode 1))

# Evil-mode<a id="sec-8" name="sec-8"></a>

Use advice to escape from insert mode, to just use evil normal and visual
states, for editing tasks, e.g. insert state, use regular emacs. *Don't know if
this really possible.*

    (use-package evil
      :diminish undo-tree-mode
      :config
      (unbind-key "C-z" evil-normal-state-map)
      (unbind-key "C-z" evil-motion-state-map)
      (unbind-key "C-z" evil-insert-state-map)
    
      (setq evil-esc-delay 0)
    
      (use-package evil-visualstar
        :config
        (global-evil-visualstar-mode t))
    
      (use-package evil-leader
        :config
        (setq evil-leader/in-all-states 1)
        (evil-leader/set-leader ",")
        (global-evil-leader-mode)
        (evil-leader/set-key "/" 'evil-search-highlight-persist-remove-all)))
    
    (use-package evil-numbers
      :demand
      :bind (:map evil-normal-state-map
                  ("+" . evil-numbers/inc-at-pt)
                  ("-" . evil-numbers/dec-at-pt)))
    
    (use-package evil-search-highlight-persist
      :config
      (global-evil-search-highlight-persist t))

# Coding setup<a id="sec-9" name="sec-9"></a>

## Syntax Check<a id="sec-9-1" name="sec-9-1"></a>

    (use-package flycheck
      :defer t
      :diminish flycheck-mode
      :config
      (use-package flycheck-pos-tip)
      (when (display-graphic-p (selected-frame))
        (eval-after-load 'flycheck
          '(custom-set-variables
            '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))))

## Templating<a id="sec-9-2" name="sec-9-2"></a>

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

### clojure<a id="sec-9-3-1" name="sec-9-3-1"></a>

    (use-package clojure-mode :defer t)
    (use-package cider :defer t)

### common lisp<a id="sec-9-3-2" name="sec-9-3-2"></a>

    (load (expand-file-name "~/quicklisp/slime-helper.el"))
    (setq inferior-lisp-program "sbcl")

### paredit<a id="sec-9-3-3" name="sec-9-3-3"></a>

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

### emacs-lisp<a id="sec-9-3-4" name="sec-9-3-4"></a>

    (add-to-list 'auto-mode-alist '("Cask"  . emacs-lisp-mode))
    
    (use-package eldoc
      :diminish eldoc-mode
      :config
      (eldoc-add-command 'paredit-backward-delete 'paredit-close-round)
      (add-lisp-hook (lambda () (eldoc-mode 1))))

## Ruby coding setup<a id="sec-9-4" name="sec-9-4"></a>

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

## C# coding setup<a id="sec-9-5" name="sec-9-5"></a>

More dig into omnisharp-emacs.

    (use-package csharp-mode :defer t)
    (use-package omnisharp
      :defer t
      :config
      (setq omnisharp-server-executable-path "~/bin/omnisharp/OmniSharp")
      (when (file-exists-p omnisharp-server-executable-path)
        (add-hook 'csharp-mode-hook 'omnisharp-mode)
        (add-to-list 'company-backends 'company-omnisharp)))

## Common coding setup<a id="sec-9-6" name="sec-9-6"></a>

    (use-package rainbow-delimiters
      :config
      (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
      (add-lisp-hook 'rainbow-delimiters-mode))
    
    (use-package color-identifiers-mode
      :diminish color-identifiers-mode
      :config
      (global-color-identifiers-mode))

# Project management<a id="sec-10" name="sec-10"></a>

Just start to use them, maybe one of both is enough? Or maybe a wrapper package
to benefit from both? (Another tough task)

## projectile<a id="sec-10-1" name="sec-10-1"></a>

    (use-package projectile
      :demand
      :config
      (projectile-global-mode)
      (setq projectile-indexing-method 'alien
            projectile-enable-caching t))

## find-file-in-project<a id="sec-10-2" name="sec-10-2"></a>

    (use-package find-file-in-project :ensure ivy)

## find-file-in-repository<a id="sec-10-3" name="sec-10-3"></a>

    (use-package find-file-in-repository)

# Emacs server<a id="sec-11" name="sec-11"></a>

Start server if not already running. Properly set server to work on MSWin is
painful.

    (add-hook 'after-init-hook
              (lambda ()
                (require 'server)
                (unless (server-running-p)
                  (server-start))))

# Bindings<a id="sec-12" name="sec-12"></a>

## Utility functions<a id="sec-12-1" name="sec-12-1"></a>

    (defcustom kess-switch-ignore-regexs
      '("\\*Ibuffer\\*" "\\*Messages\\*" "\\*scratch\\*")
      "Regex list for filter buffer names which will be ignored while
    switching buffer through `kess--switch-buffer'.")
    
    (defun kess--match-ignores (patterns buffer)
      "Match given buffer name BUFFER with all patterns in PATTERNS.
    
    Return t if a match is found, otherwise nil."
      (and patterns
           (or (string-match-p (car patterns) buffer)
               (kess--match-ignores (cdr patterns) buffer))))
    
    (defun kess--switch-buffer (&optional prev)
      "Switch buffer, skip those buffer names specified in `kess-switch-ignore-regexs'.
    
     Switch to next buffer by default, if PREV is non nil then switch
    to previous buffer."
      (let ((bread-crumb (buffer-name))
            (switch-fn (or (and prev 'previous-buffer) 'next-buffer)))
        (funcall switch-fn)
        (while (and (not (equal bread-crumb (buffer-name)))
                    (kess--match-ignores kess-switch-ignore-regexs (buffer-name)))
          (funcall switch-fn))))
    
    (defun kess--switch-next-win-or-buf (&optional force-buffer)
      "Switch to next window when FORCE-BUFFER is nil or just one
    window in frame, otherwise switch to next buffer.
    
    When switch buffer call `kess--switch-buffer' with default
    argument."
      (interactive "P")
      (if (or force-buffer (one-window-p 'nomini))
          (kess--switch-buffer)
        (other-window 1)))
    
    (defun kess--switch-prev-win-or-buf (&optional force-buffer)
      "Switch to previous window when FORCE-BUFFER is nil or just one
    window in frame, otherwise switch to previous buffer.
    
    Switch buffer by call `kess--switch-buffer' with 'PREV."
      (interactive "P")
      (if (or force-buffer (one-window-p 'nomini))
          (kess--switch-buffer 'prev)
        (other-window -1)))
    
    (defun kess--indent-buffer ()
      "Indent whole buffer."
      (interactive)
      (indent-region (point-min) (point-max) nil))
    
    (defun kess--kill-buf-or-win (&optional force-buffer)
      "Kill current buffer or delete window (if not single window)."
      (interactive "P")
      (if (or force-buffer (one-window-p 'nomini))
          (kill-buffer)
        (delete-window)))
    
    (defun kess--delete-other-windows ()
      "Delete other windows and recenter current window to middle."
      (interactive)
      (delete-other-windows)
      (recenter))
    
    (defun kess--cycle-ivy-regex-method ()
      "Cycle switch ivy minibuffer regex match method."
      (interactive)
      (let ((method (assoc t ivy-re-builders-alist))
            (methods '(;ivy--regex regexp-quote
                       ivy--regex-plus ivy--regex-fuzzy)))
        (if (null method)
            (setq-default ivy-re-builders-alist '((t . ivy--regex-plus)))
          (let ((next (cadr (member (cdr method) methods))))
            (setcdr method (or next (car methods)))))))

## Global bindings<a id="sec-12-2" name="sec-12-2"></a>

    (bind-keys ("<backspace>" . delete-backward-char))
    
    (bind-keys* ("<M-left>" . windmove-left)
                ("<M-down>" . windmove-down)
                ("<M-up>" . windmove-up)
                ("<M-right>" . windmove-right)
    
                ("<C-up>" . scroll-down-line)
                ("<C-down>" . scroll-up-line)
    
                ("M-N" . scroll-other-window)
                ("M-P" . scroll-other-window-down)
    
                ("M-x" . counsel-M-x)
                ("M-X" . smex)
    
                ("C-'" . set-mark-command)
                ("C-;" . mark-sexp)
    
                ("C-/" . swiper)
                ("C-`" . ivy-resume)
    
                ("C-z" . undo-tree-undo)
                ("M-z" . undo-tree-redo)
                ("C-S-z" . undo-tree-visualize)
    
                ("M-D" . eval-defun)
                ("M-R" . eval-region)
                ("M-B" . eval-buffer)
    
                ("C-x C-f" . counsel-find-file)
                ("C-x f" . find-file-in-current-directory)
                ("M-o" . find-file-in-repository)
                ("M-O" . find-file-in-project)
    
                ("C-S-g" . occur)
                ("C-S-s" . save-some-buffers)
    
                ("<C-tab>" . kess--switch-next-win-or-buf)
                ("<C-S-tab>" . kess--switch-prev-win-or-buf)
                ("C-M-|" . kess--indent-buffer)
                ("M-`" . kess--kill-buf-or-win)
    
                ("C-+" . evil-numbers/inc-at-pt)
                ("C-_" . evil-numbers/dec-at-pt)
                ("C-:" . evil-ex)
                ("C-S-j" . evil-join)
                ("C-M-J" . join-line)
    
                ("C-M-/" . query-replace)
                ("C-M-?" . query-replace-regexp)
    
                ("C-h t" . cider-drink-a-sip)
                ("C-h T" . help-with-tutorial)
    
                ("C-h N" . describe-language-environment)
                ("C-h H" . view-hello-file)
    
                ("C-h h" . counsel-info-lookup-symbol)
                ("C-h L" . counsel-find-library)
                ("C-h u" . counsel-unicode-char))

## Mode-map bindings<a id="sec-12-3" name="sec-12-3"></a>

    (bind-keys :map Info-mode-map
               ("<backspace>" . Info-scroll-down))
    (bind-keys :map lisp-interaction-mode-map
               ("<C-return>" . eval-print-last-sexp))

## Custom prefix keymap<a id="sec-12-4" name="sec-12-4"></a>

To not mess up with emacs's own and other package's prefix maps, my custom
prefix binding use C-\\, which I think very easy to reach.

    ;; C-\ prefix map for nearly all my custom bindings, to not mess up
    ;; default or other installed package's bindings
    (define-prefix-command 'kess-prefix-map)
    (bind-key* (kbd "C-\\") kess-prefix-map)
    (bind-keys :map kess-prefix-map
               ("C-." . describe-personal-keybindings)
               ("\\" . evil-search-highlight-persist-remove-all)
               ("C-\\" . kess--delete-other-windows)
               ("/" . comment-region)
               ("C-/" . uncomment-region)
    
               ("ESC" . evil-mode)
               ("TAB" . org-force-cycle-archived)
               ("RET" . winner-redo)
               ("<backspace>" . winner-undo)
    
               ("`" . kill-buffer-and-window)
               ("0" . delete-frame)
               ("a" . org-archive-to-archive-sibling)
               ("b" . switch-to-buffer-other-window)
               ("c" . cider-jack-in)
               ("d" . dired-other-window)
               ("f" . find-file-other-window)
               ("C-f" . flycheck-mode)
               ("g" . counsel-ag)
               ("C-g" . counsel-git)
               ("j" . counsel-git-grep)
               ("l" . counsel-locate)
               ("r" . inf-ruby)
               ("s" . slime)
               ("x" . execute-extended-command)
               ("C-x" . smex-major-mode-commands)
               ("z" . zap-up-to-char)
               ("C-z" . zap-to-char))
