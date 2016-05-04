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

;; A string color that is neutral when context coloring
(set-face-foreground 'font-lock-string-face "color-246")


;; Context coloring
(add-hook 'js2-mode-hook 'context-coloring-mode)
(require 'context-coloring)
(custom-set-faces
 '(context-coloring-level-0-face ((t (:foreground "color-255"))))
 '(context-coloring-level-1-face ((t (:foreground "color-81"))))
 '(context-coloring-level-2-face ((t (:foreground "color-175"))))
 '(context-coloring-level-3-face ((t (:foreground "color-42"))))
 '(context-coloring-level-4-face ((t (:foreground "color-27"))))
 '(context-coloring-level-5-face ((t (:foreground "color-92"))))
 '(context-coloring-level-6-face ((t (:foreground "color-23"))))
 )

(add-hook 'js2-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))

;;(require 'rainbow-delimiters)
;;(dolist (hook '(js2-mode-hook js-mode-hook json-mode-hook))
;;    (add-hook hook 'rainbow-delimiters-mode))

(custom-set-variables
 '(js2-bounce-indent-p nil))

;; Flycheck syntax checking
(setq
 js2-mode-show-parse-errors nil
 js2-mode-show-strict-warnings nil)
(custom-set-faces
 '(flycheck-error
   ((t (:inherit default :foreground "red" :underline (:color "red"))))))
(add-hook 'js2-mode-hook 'flycheck-mode)
(setq flycheck-idle-change-delay 1);

(flycheck-def-config-file-var
    flycheck-jscs
    javascript-jscs
    ".jscsrc"
  :safe #'stringp)

(flycheck-define-checker javascript-jscs
  "A jscs code style checker."
  :command ("jscs" "--reporter" "checkstyle"
            (config-file "--config" flycheck-jscs) source)
  :error-parser flycheck-parse-checkstyle
  :modes (js-mode js2-mode js3-mode)
  :next-checkers (javascript-jshint))

(provide 'flycheck-jscs)
(add-to-list 'flycheck-checkers 'javascript-jscs)

;; 80 column fill
(setq-default fill-column 80)

;; 80 column rule
(require 'fill-column-indicator)
(add-hook 'js2-mode-hook 'fci-mode)
(setq fci-rule-color "color-241")
(setq fci-rule-character ?.)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f9] 'neotree-find)

(require 'git-gutter)
(global-git-gutter-mode +1)

(require 'toggle-quotes)
(global-set-key (kbd "C-[ [ ' '") 'toggle-quotes)

(require 'floobits)
(floobits-remove-hooks)
