;;; buffer-setup.el --- Buffer setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

;; switch to previous/next buffer (skip *[buffer]*)
;; from stackoverflow, with some modifications
(defun prev-non-start-buffer ()
  "Switch to previous non *[buffer]* buffer."
  (interactive)
  (let ((bread-crumb (buffer-name)))
    (previous-buffer)
    (while (and (string-match-p "^\*" (buffer-name))
                (not (equal bread-crumb (buffer-name))))
      (previous-buffer))))

(defun next-non-start-buffer ()
  "Switch to next non *[buffer]* buffer."
  (interactive)
  (let ((bread-crumb (buffer-name)))
    (next-buffer)
    (while (and (string-match-p "^\*.*\*$" (buffer-name))
                (not (equal bread-crumb (buffer-name))))
      (next-buffer))))

(provide 'buffer-setup)

;;; buffer-setup.el ends here
