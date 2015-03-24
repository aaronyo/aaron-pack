; Remove Gabe's key bindings for arrows
(dolist (elt '("<left>" "<right>" "<up>" "<down>"))
  (progn
   (global-unset-key (kbd elt))))

(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

(global-set-key (kbd "<left>") 'left-char)
(global-set-key (kbd "<right>") 'right-char)
(global-set-key (kbd "<up>") 'previous-line)
(global-set-key (kbd "<down>") 'next-line)

;; C->
(global-set-key (kbd "C-[ [ a a") 'mc/mark-next-like-this)
;; C-<
(global-set-key (kbd "C-[ [ b b") 'mc/mark-previous-like-this)
;; C-?
(global-set-key (kbd "C-[ [ c c") 'mc/mark-all-like-this)

(global-set-key (kbd "C-x t") 'projectile-find-file)
;; C-[
(global-set-key (kbd "C-[ [ w l") 'windmove-left)
;; C-]
(global-set-key (kbd "C-[ [ w r") 'windmove-right)

;; Flycheck will handle js errors with jshint
(setq
 js2-mode-show-parse-errors nil
 js2-mode-show-strict-warnings nil)

(custom-set-faces
 '(context-coloring-level-1-face ((t (:foreground "color-75"))))
 '(context-coloring-level-2-face ((t (:foreground "color-175"))))
 '(context-coloring-level-3-face ((t (:foreground "color-143"))))
 '(context-coloring-level-4-face ((t (:foreground "brightred"))))
 '(context-coloring-level-5-face ((t (:foreground "color-92"))))
 '(context-coloring-level-6-face ((t (:foreground "color-202"))))
 '(flycheck-error
   ((t (:inherit default :foreground "red" :underline (:color "red"))))))

;;(require 'rainbow-delimiters)
;;(dolist (hook '(js2-mode-hook js-mode-hook json-mode-hook))
;;    (add-hook hook 'rainbow-delimiters-mode))
(add-hook 'js2-mode-hook 'context-coloring-mode)
(add-hook 'js2-mode-hook 'flycheck-mode)

;; 80 column fill
(setq-default fill-column 80)

;; 80 column rule
(require 'fill-column-indicator)
(add-hook 'js2-mode-hook 'fci-mode)
(setq fci-rule-color "color-241")
(setq fci-rule-character ?.)
