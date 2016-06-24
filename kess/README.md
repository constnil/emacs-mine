<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. KESS - Keep Emacs Simple, Stupid!</a>
<ul>
<li><a href="#sec-1-1">1.1. Personal information</a></li>
<li><a href="#sec-1-2">1.2. Setup load paths</a></li>
<li><a href="#sec-1-3">1.3. Package Setup</a>
<ul>
<li><a href="#sec-1-3-1">1.3.1. package.el</a></li>
<li><a href="#sec-1-3-2">1.3.2. use-package</a></li>
</ul>
</li>
<li><a href="#sec-1-4">1.4. Default Setup</a>
<ul>
<li><a href="#sec-1-4-1">1.4.1. better-defaults</a></li>
<li><a href="#sec-1-4-2">1.4.2. emacs apperence</a></li>
<li><a href="#sec-1-4-3">1.4.3. My defaults</a></li>
<li><a href="#sec-1-4-4">1.4.4. Session and history</a></li>
<li><a href="#sec-1-4-5">1.4.5. Spell check</a></li>
</ul>
</li>
<li><a href="#sec-1-5">1.5. Orgmode</a>
<ul>
<li><a href="#sec-1-5-1">1.5.1. Variable settings</a></li>
<li><a href="#sec-1-5-2">1.5.2. Keywords for todo tasks</a></li>
<li><a href="#sec-1-5-3">1.5.3. Template skeletons</a></li>
<li><a href="#sec-1-5-4">1.5.4. Bindings</a></li>
</ul>
</li>
<li><a href="#sec-1-6">1.6. Custom prefix keymap</a></li>
<li><a href="#sec-1-7">1.7. Global bindings</a>
<ul>
<li><a href="#sec-1-7-1">1.7.1. buffer bindings</a></li>
<li><a href="#sec-1-7-2">1.7.2. frame bindings</a></li>
<li><a href="#sec-1-7-3">1.7.3. window bindings</a></li>
<li><a href="#sec-1-7-4">1.7.4. navigation bindings</a></li>
<li><a href="#sec-1-7-5">1.7.5. search and replace bindings</a></li>
<li><a href="#sec-1-7-6">1.7.6. org-mode bindings</a></li>
<li><a href="#sec-1-7-7">1.7.7. other bindings</a></li>
</ul>
</li>
<li><a href="#sec-1-8">1.8. Essential packages</a>
<ul>
<li><a href="#sec-1-8-1">1.8.1. undo-tree</a></li>
<li><a href="#sec-1-8-2">1.8.2. ido</a></li>
<li><a href="#sec-1-8-3">1.8.3. smex</a></li>
<li><a href="#sec-1-8-4">1.8.4. company</a></li>
</ul>
</li>
<li><a href="#sec-1-9">1.9. Project management</a>
<ul>
<li><a href="#sec-1-9-1">1.9.1. projectile</a></li>
<li><a href="#sec-1-9-2">1.9.2. find-file-in-project</a></li>
</ul>
</li>
<li><a href="#sec-1-10">1.10. Useful handy packages</a></li>
<li><a href="#sec-1-11">1.11. Evil-mode</a>
<ul>
<li><a href="#sec-1-11-1">1.11.1. Features &amp; thoughts</a></li>
<li><a href="#sec-1-11-2">1.11.2. Evil setup</a></li>
</ul>
</li>
<li><a href="#sec-1-12">1.12. Common coding setup</a>
<ul>
<li><a href="#sec-1-12-1">1.12.1. Binding</a></li>
<li><a href="#sec-1-12-2">1.12.2. Parens</a>
<ul>
<li><a href="#sec-1-12-2-1">1.12.2.1. smartparens</a></li>
</ul>
</li>
<li><a href="#sec-1-12-3">1.12.3. Syntax</a></li>
<li><a href="#sec-1-12-4">1.12.4. Templating</a></li>
</ul>
</li>
<li><a href="#sec-1-13">1.13. Programming language setup</a>
<ul>
<li><a href="#paredit">1.13.1. Lisp coding setup</a></li>
<li><a href="#sec-1-13-2">1.13.2. paredit</a></li>
<li><a href="#sec-1-13-3">1.13.3. emacs-lisp</a></li>
<li><a href="#sec-1-13-4">1.13.4. clojure</a></li>
<li><a href="#sec-1-13-5">1.13.5. common lisp</a></li>
<li><a href="#sec-1-13-6">1.13.6. C# coding setup</a></li>
</ul>
</li>
<li><a href="#sec-1-14">1.14. Study and bring-in packages</a></li>
<li><a href="#sec-1-15">1.15. Emacs server</a></li>
</ul>
</li>
</ul>
</div>
</div>


# KESS - Keep Emacs Simple, Stupid!<a id="sec-1" name="sec-1"></a>

OK, the following configuration not **simple** at all, but I'm trying achieve this
goal as I'm getting more comfortable with emacs.

## Personal information<a id="sec-1-1" name="sec-1-1"></a>

    (setq user-full-name "Tiefeng Wu"
          user-mail-address "icebergwtf@qq.com")

## Setup load paths<a id="sec-1-2" name="sec-1-2"></a>

    ;; Setup modules are placed in setup directory
    ;; (add-to-list 'load-path (concat user-emacs-directory "/lisp"))
    ;; (add-to-list 'load-path (concat user-emacs-directory "/setup"))

## Package Setup<a id="sec-1-3" name="sec-1-3"></a>

### package.el<a id="sec-1-3-1" name="sec-1-3-1"></a>

Setup archive lists and initialize package.el

    ;; package.el setup
    (let ((archives
           '((       "melpa" . "http://melpa.org/packages/")
             ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
             (   "marmalade" . "http://marmalade-repo.org/packages/")
             (         "org" . "http://orgmode.org/elpa/"))))
      (when (< emacs-major-version 24)
        (add-to-list 'archives
                     '("gnu" . "http://elpa.gnu.org/packages/")))
      (dolist (arch archives)
        (add-to-list 'package-archives arch)))
    (package-initialize)

### use-package<a id="sec-1-3-2" name="sec-1-3-2"></a>

use-package is very handy for package management, also I use bind-key to define
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
      :bind* ("C-c C-." . describe-personal-keybindings))

## Default Setup<a id="sec-1-4" name="sec-1-4"></a>

### better-defaults<a id="sec-1-4-1" name="sec-1-4-1"></a>

Use better-defaults package as start point

    (use-package better-defaults)

### emacs apperence<a id="sec-1-4-2" name="sec-1-4-2"></a>

Load faviorite theme, and since I'm still an emacs newbie, I perfer to enable
menu bar under GUI mode, whenever I'm getting lost, menu bar come for rescue.

    (load-theme 'tango-dark)
    (when window-system
      (menu-bar-mode 1))

### My defaults<a id="sec-1-4-3" name="sec-1-4-3"></a>

My perfered settings.

    (setq-default tab-width 4
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
          diff-switches "-u")
    
    (global-linum-mode t)

### Session and history<a id="sec-1-4-4" name="sec-1-4-4"></a>

Borrowed from [Emacs and Hacks II](https://ebzzry.github.io/emacs-hacks-2.html), with my changes.
*(Somehow, desktop saving caused error on my MBP, need more deep understanding in desktop.el)*

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
    
    ;; savehist
    (savehist-mode t)
    (setq savehist-file (concat user-emacs-directory "savehist"))

### Spell check<a id="sec-1-4-5" name="sec-1-4-5"></a>

    ;; (require 'ispell)
    ;; (setq ispell-local-dictionary "en_US")
    ;; (setq ispell-local-dictionary-alist
    ;;       '(("en_US"
    ;;          "[[:alpha:]]"
    ;;          "[^[:alpha:]]"
    ;;          "[']"
    ;;          nil
    ;;          nil
    ;;          nil
    ;;          utf-8)))
    ;; (ispell-change-dictionary "en_US" t)

## Orgmode<a id="sec-1-5" name="sec-1-5"></a>

### Variable settings<a id="sec-1-5-1" name="sec-1-5-1"></a>

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

### Keywords for todo tasks<a id="sec-1-5-2" name="sec-1-5-2"></a>

    (setq org-todo-keywords
          '((sequence "TODO(t)" "|" "DONE(d)")
            (sequence "OPEN(o)" "INSPECT(i)" "|" "FIXED(f)" "CLOSED(c)" "WONTFIX(w)" "NOREPROD(n)")
            (sequence "QUESTION(q) | ANSWERED(a)")))

### Template skeletons<a id="sec-1-5-3" name="sec-1-5-3"></a>

*Learn more about skeleton, or use yasnippet instead?*

    (require 'org)
    (add-hook 'org-mode-hook 'abbrev-mode)
    
    (define-skeleton sk-org-exp
      "Input #+BEGIN_EXAMPLE #+END_EXAMPLE in org-mode"
      ""
      "#+BEGIN_EXAMPLE\n"
      _ "\n"
      "#+END_EXAMPLE")
      (define-abbrev org-mode-abbrev-table "iexp" "" 'sk-org-exp)
    
      (define-skeleton sk-org-src
      "Input #+BEGIN_SRC #+END_SRC in org-mode"
      ""
      "#+BEGIN_SRC emacs-lisp\n"
      _ "\n"
      "#+END_SRC")
      (define-abbrev org-mode-abbrev-table "isrc" "" 'sk-org-src)
    
      (define-skeleton sk-org-prop
      "Input :PROPERTIES: :END: in org-mode"
      ""
      >":PROPERTIES:\n"
      > _ "\n"
      >":END:")
      (define-abbrev org-mode-abbrev-table "iprop" "" 'sk-org-prop)
    
      (define-skeleton sk-org-html
      ""
      ""
      "#+BEGIN_HTML\n"
      "<pre lang=\"lisp\" line=\"1\">\n"
      _"\n"
      "</pre>\n"
      "#+END_HTML\n")
      (define-abbrev org-mode-abbrev-table "ihtml"  "" 'sk-org-html)

### Bindings<a id="sec-1-5-4" name="sec-1-5-4"></a>

    (bind-keys :map org-mode-map
               ("C-c <C-tab>" . org-force-cycle-archived)
               ("M-n" . org-forward-heading-same-level)
               ("M-p" . org-backward-heading-same-level))

## Custom prefix keymap<a id="sec-1-6" name="sec-1-6"></a>

    ;; C-` prefix map (mainly mark related bindings)
    (define-prefix-command 'kess-prefix-map)
    (bind-key* (kbd "C-`") kess-prefix-map)
    (bind-keys :map kess-prefix-map
               ("C-`" . set-mark-command))

## Global bindings<a id="sec-1-7" name="sec-1-7"></a>

### buffer bindings<a id="sec-1-7-1" name="sec-1-7-1"></a>

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
                  (indent-region (point-min) (point-max) nil)))
     ("C-x s" . write-file)
     ("C-S-s" . save-some-buffers))

### frame bindings<a id="sec-1-7-2" name="sec-1-7-2"></a>

    ;; frame
    (bind-keys* ("C-c o" . other-frame)
                ("C-c 0" . delete-frame))

### window bindings<a id="sec-1-7-3" name="sec-1-7-3"></a>

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

### navigation bindings<a id="sec-1-7-4" name="sec-1-7-4"></a>

    ;; navigation
    (bind-keys ("M-n" . forward-paragraph)
               ("M-p" . backward-paragraph))

### search and replace bindings<a id="sec-1-7-5" name="sec-1-7-5"></a>

    ;; search/replace
    (bind-keys* ("C-M-/" . query-replace)
                ("C-M-?" . query-replace-regexp))

### org-mode bindings<a id="sec-1-7-6" name="sec-1-7-6"></a>

    (bind-keys* ("C-c a" . org-agenda)
                ("C-c b" . org-iswitchb)
                ("C-c c" . org-capture)
                ("C-c l" . org-store-link)
                ("C-c t" . org-tags-view))

### other bindings<a id="sec-1-7-7" name="sec-1-7-7"></a>

    ;; misc
    (bind-keys* ("<backspace>" . delete-backward-char)
                ("M-\\" . hippie-expand))

## Essential packages<a id="sec-1-8" name="sec-1-8"></a>

### undo-tree<a id="sec-1-8-1" name="sec-1-8-1"></a>

    (use-package undo-tree
      :bind* (("C-/" . undo-tree-undo)
              ("M-/" . undo-tree-redo))
      :config
      (global-undo-tree-mode))

### ido<a id="sec-1-8-2" name="sec-1-8-2"></a>

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

### smex<a id="sec-1-8-3" name="sec-1-8-3"></a>

    (use-package smex
      :bind* (("M-x" . smex)
              ("M-X" . smex-major-mode-commands)
              ("C-c M-x" . execute-extended-command)))

### company<a id="sec-1-8-4" name="sec-1-8-4"></a>

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

## Project management<a id="sec-1-9" name="sec-1-9"></a>

### projectile<a id="sec-1-9-1" name="sec-1-9-1"></a>

    (use-package projectile
      :demand
      :bind* (("M-o" . projectile-find-file-dwim)
              ("M-O" . projectile-find-file-dwim-other-window))
      :config
      (projectile-global-mode)
      (setq projectile-indexing-method 'alien
            projectile-enable-caching t)
      (use-package ag))

### find-file-in-project<a id="sec-1-9-2" name="sec-1-9-2"></a>

    (use-package find-file-in-project
      :ensure ivy)

## Useful handy packages<a id="sec-1-10" name="sec-1-10"></a>

    (use-package popwin
      :config
      (popwin-mode 1))

## Evil-mode<a id="sec-1-11" name="sec-1-11"></a>

Maybe I can totally discard later?  And I'm think about develop a minor mode
like [god-mode](https://github.com/chrisdone/god-mode) and evil-mode, but just a thin layer to provide vim's normal state
and visual state.

### Features & thoughts<a id="sec-1-11-1" name="sec-1-11-1"></a>

-   use CapsLock to switch
-   insert state is pure emacs
-   normal state + visual state = view state (or browse state?)

### Evil setup<a id="sec-1-11-2" name="sec-1-11-2"></a>

    (use-package evil
      :diminish undo-tree-mode
      :bind (("C-~" . evil-mode)
             :map evil-normal-state-map
             ("j" . evil-next-visual-line)
             ("k" . evil-previous-visual-line)
             ("C-a" . evil-beginning-of-line)
             ("C-e" . evil-end-of-line)
             ([escape] . keyboard-quit)
             :map evil-emacs-state-map
             ([escape] . evil-normal-state))
      :config
      (unbind-key "C-z" evil-motion-state-map)
      (unbind-key "C-z" evil-insert-state-map)
    
      (setq evil-esc-delay 0)
    
      (use-package evil-visualstar
        :config
        (global-evil-visualstar-mode t))
    
      (use-package evil-numbers
        :bind (:map evil-normal-state-map
                    ("+" . evil-numbers/inc-at-pt)
                    ("-" . evil-numbers/dec-at-pt))))

## Common coding setup<a id="sec-1-12" name="sec-1-12"></a>

### Binding<a id="sec-1-12-1" name="sec-1-12-1"></a>

    (bind-keys* ("C-c r" . comment-region)
                ("C-c u" . uncomment-region))

### Parens<a id="sec-1-12-2" name="sec-1-12-2"></a>

I'm confusing about parens related packages, for now my simple understanding is:
-   use smartparens for common coding parens and pair management (there still
    another variations like autopair, wrapper-region, electric-pair-mode).
-   use paredit for lisp language, see blew Lisp coding setup (See section 1.13.1).

#### smartparens<a id="sec-1-12-2-1" name="sec-1-12-2-1"></a>

    (show-paren-mode 1)
    (use-package rainbow-delimiters
      :config
      (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
    
    (use-package smartparens-config
      :ensure smartparens
      :demand
      :bind (:map smartparens-mode-map
                  ("M-k" . sp-kill-sexp)
                  ("M-K" . sp-kill-hybrid-sexp)
                  ("<C-M-backspace>" . sp-backward-kill-sexp)
    
                  ;; ("C-M-a" . sp-beginning-of-sexp)
                  ;; ("C-M-e" . sp-end-of-sexp)
    
                  ;; ("C-<down>" . sp-down-sexp)
                  ;; ("C-<up>"   . sp-up-sexp)
                  ;; ("M-<down>" . sp-backward-down-sexp)
                  ;; ("M-<up>"   . sp-backward-up-sexp)
    
                  ;; ("C-M-f" . sp-forward-sexp)
                  ;; ("C-M-b" . sp-backward-sexp)
    
                  ;; ("C-M-n" . sp-next-sexp)
                  ;; ("C-M-p" . sp-previous-sexp)
    
                  ;; ("C-S-f" . sp-forward-symbol)
                  ;; ("C-S-b" . sp-backward-symbol)
    
                  ;; ("C-<right>" . sp-forward-slurp-sexp)
                  ;; ("M-<right>" . sp-forward-barf-sexp)
                  ;; ("C-<left>"  . sp-backward-slurp-sexp)
                  ;; ("M-<left>"  . sp-backward-barf-sexp)
    
                  ;; ("C-M-t" . sp-transpose-sexp)
                  ;; ("C-M-w" . sp-copy-sexp)
    
                  ;; ("C-M-d" . delete-sexp)
    
                  ;; ("M-<backspace>" . backward-kill-word)
                  ;; ("C-<backspace>" . sp-backward-kill-word)
                  ;; ([remap sp-backward-kill-word] . backward-kill-word)
    
                  ;; ("M-[" . sp-backward-unwrap-sexp)
                  ;; ("M-]" . sp-unwrap-sexp)
    
                  ;; ("C-x C-t" . sp-transpose-hybrid-sexp)
    
                  ;; ("C-c ("  . wrap-with-parens)
                  ;; ("C-c ["  . wrap-with-brackets)
                  ;; ("C-c {"  . wrap-with-braces)
                  ;; ("C-c '"  . wrap-with-single-quotes)
                  ;; ("C-c \"" . wrap-with-double-quotes)
                  ;; ("C-c _"  . wrap-with-underscores)
                  ;; ("C-c `"  . wrap-with-back-quotes))
                  )
      :config
      (show-smartparens-global-mode t)
      (smartparens-strict-mode 1)
      (add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
      (add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode))

### Syntax<a id="sec-1-12-3" name="sec-1-12-3"></a>

    (use-package flycheck
      :diminish flycheck-mode
      :bind* ("C-c C-f" . flycheck-mode)
      :config
      (use-package flycheck-pos-tip)
      (when (display-graphic-p (selected-frame))
        (eval-after-load 'flycheck
          '(custom-set-variables
            '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))))

### Templating<a id="sec-1-12-4" name="sec-1-12-4"></a>

    (use-package yasnippet
      :diminish yas-minor-mode
      :config
      (setq yas-snippet-dirs (concat user-emacs-directory "snippets"))
      (yas-global-mode 1))

## Programming language setup<a id="sec-1-13" name="sec-1-13"></a>

### Lisp coding setup<a id="paredit" name="paredit"></a>

### paredit<a id="sec-1-13-2" name="sec-1-13-2"></a>

    (use-package paredit
      :demand
      :bind (:map paredit-mode-map
                  ("C-\>" . paredit-forward-slurp-sexp)
                  ("C-\<" . paredit-forward-barf-sexp)
                  ("C-M-\>" . paredit-backward-barf-sexp)
                  ("C-M-\<" . paredit-backward-slurp-sexp))
      :config
      (dolist (x '(scheme emacs-lisp lisp clojure lisp-interaction slime-repl cider-repl))
        (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'enable-paredit-mode)))

### emacs-lisp<a id="sec-1-13-3" name="sec-1-13-3"></a>

    (use-package eldoc
      :diminish eldoc-mode
      :config
      (eldoc-add-command 'paredit-backward-delete 'paredit-close-round)
      (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
      (add-hook 'lisp-interaction-mode-hook 'eldoc-mode))
    
    (bind-keys* ("C-x C-r" . eval-region)
                ("C-x C-d" . eval-defun)
                ("C-x C-w" . eval-buffer))

### clojure<a id="sec-1-13-4" name="sec-1-13-4"></a>

    (use-package clojure-mode :defer t)
    (use-package cider :defer t)

### common lisp<a id="sec-1-13-5" name="sec-1-13-5"></a>

    (load (expand-file-name "~/quicklisp/slime-helper.el"))
    (setq inferior-lisp-program "clisp")

### C# coding setup<a id="sec-1-13-6" name="sec-1-13-6"></a>

More dig into omnisharp-emacs.

    (use-package csharp-mode)
    ;; (use-package omnisharp
    ;;   :config
    ;;   (setq omnisharp-server-executable-path "~/warehouse/builds/OmniSharpServer/OmniSharp/bin/Release/OmniSharp.exe"
    ;;         ;;        "~/warehouse/builds/omnisharp-roslyn/artifacts/publish/OmniSharp/default/net451/OmniSharp.exe"
    ;;         )
    ;;   (when (file-exists-p omnisharp-server-executable-path)
    ;;     (add-hook 'csharp-mode-hook 'omnisharp-mode)
    ;;     (add-to-list 'company-backends 'company-omnisharp)))

## Study and bring-in packages<a id="sec-1-14" name="sec-1-14"></a>

    ;; (use-package ack)
    ;; (use-package bookmark+)
    ;; (use-package markdown-mode+)
    ;; (use-package magit
    ;;   :config
    ;;   (setq magit-last-seen-setup-instructions "1.4.0")
    ;;   (add-hook 'magit-log-edit-mode-hook
    ;;             (lambda ()
    ;;               (set-fill-column 72)
    ;;               (auto-fill-mode 1))))

## Emacs server<a id="sec-1-15" name="sec-1-15"></a>

Start server if not already running.

    (require 'server)
    (when (not (eq (server-running-p) t))
      (add-hook 'after-init-hook 'server-start))
