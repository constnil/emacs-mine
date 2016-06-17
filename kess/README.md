<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. KESS - Keep Emacs Simple, Stupid</a>
<ul>
<li><a href="#sec-1-1">1.1. Setup load pathes</a></li>
<li><a href="#sec-1-2">1.2. package.el</a></li>
</ul>
</li>
</ul>
</div>
</div>

# KESS - Keep Emacs Simple, Stupid<a id="sec-1" name="sec-1"></a>

## Setup load pathes<a id="sec-1-1" name="sec-1-1"></a>

    ;; Setup modules are placed in setup directory
    (add-to-list 'load-path (concat user-emacs-directory "/lisp"))
    (add-to-list 'load-path (concat user-emacs-directory "/setup"))

## package.el<a id="sec-1-2" name="sec-1-2"></a>

    (require 'kess-defaults)
    (require 'kess-comp)
    (require 'kess-org)
    (require 'kess-project)
    (require 'kess-coding)
    (require 'kess-evil)
    
    (require 'server)
    (when (not (eq (server-running-p) t))
      (server-start))
