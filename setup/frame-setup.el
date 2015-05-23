;;; frame-setup.el --- Frame (mainly under GUI) setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

(when window-system
  (tool-bar-mode -1)
  ;; windows system frame default size
  (add-to-list 'default-frame-alist '(height . 40))
  (add-to-list 'default-frame-alist '(width . 150)))

(scroll-bar-mode -1)

(provide 'frame-setup)

;;; frame-setup.el ends here
