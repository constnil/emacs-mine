;;; buffer-setup.el --- Buffer setups.

;; Copyright (C) 2015, Wu Tiefeng.

;; Author: Wu Tiefeng <IcebergWTF@qq.com>
;; Maintainer: Wu Tiefeng

;;; Commentary:

;;; Code:

;; switch to previous/next buffer (skip *[buffer]*)
;; from stackoverflow, with some modifications
(defun scratch-buffer-p ()
  (equal "*scratch*" (buffer-name)))

(defun non-start-buffer-p (bread-crumb)
  (and (not (equal bread-crumb (buffer-name)))
       (and (not (scratch-buffer-p))
            (string-match-p "^\*.*\*$" (buffer-name)))))

(defun prev-non-start-buffer ()
  "Switch to previous non *[buffer]* buffer."
  (interactive)
  (let ((bread-crumb (buffer-name)))
    (previous-buffer)
    (while (non-start-buffer-p bread-crumb)
      (previous-buffer))))

(defun next-non-start-buffer ()
  "Switch to next non *[buffer]* buffer."
  (interactive)
  (let ((bread-crumb (buffer-name)))
    (next-buffer)
    (while (non-start-buffer-p bread-crumb)
      (next-buffer))))

(provide 'buffer-setup)

;;; buffer-setup.el ends here
