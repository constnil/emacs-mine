;;; server-setup.el --- Emacs server setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(require 'server)
(when (not (eq (server-running-p) t))
  (server-start))

(provide 'server-setup)

;;; server-setup.el ends here
