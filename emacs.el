(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (misterioso)))
 '(fci-rule-color "#383838")
 '(flycheck-coffeelintrc "/Users/villanopack/.coffeelint.json")
 '(js-indent-level 2)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(web-mode-code-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))

(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))

(defun scroll-down-half ()         
  (interactive)                    
  (scroll-down (window-half-height)))

(global-set-key [next] 'scroll-up-half)
(global-set-key [prior] 'scroll-down-half)

(add-hook 'ruby-mode-hook
	  (lambda ()
	    (define-key ruby-mode-map "\C-c#" 'comment-or-uncomment-region)
	    )
	  )

(eval-after-load "coffee-mode"
  '(progn
     (define-key coffee-mode-map (kbd "C-j") 'comment-or-uncomment-region)))

(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

;;(add-hook 'js-mode-hook 'flymake-jslint-load)


(defun ruby-insert-end ()
  "Insert \"end\" at point and reindent current line."
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

(defun my-ruby-mode-hooks ()
(linum-mode)
(local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(flycheck-mode)
(rubocop-mode)
(whitespace-mode)
(require 'ruby-electric)
(ruby-electric-mode t)
(robe-mode))

(add-hook 'ruby-mode-hook
          (lambda ()
            (my-ruby-mode-hooks)))

(add-hook 'ruby-mode-hook 'whitespace-cleanup-mode)
(add-hook 'javascript-mode-hook 'whitespace-cleanup-mode)
(add-hook 'coffee-mode-hook 'whitespace-cleanup-mode)

(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(require 'expand-region)
(global-set-key (kbd "C-c =") 'er/expand-region)

;;; Code:
;; keys
;;(setq mac-command-modifier 'hyper)
;;(setq mac-option-modifier 'meta)
(setq mac-option-modifier 'meta)
(mac-switch-meta)

;; projectile
(setq projectile-completion-system 'grizzl)

;; indent-guide
(require 'indent-guide)

;; git-gutter
(require 'git-gutter-fringe+)
(set-face-foreground 'git-gutter-fr+-modified "yellow")
(set-face-foreground 'git-gutter-fr+-added    "blue")
(set-face-foreground 'git-gutter-fr+-deleted  "white")

;;(disable-theme 'zenburn)
;;(load-theme 'afternoon t)
(setq-default line-spacing 1)

;; start maximized
;; (toggle-frame-fullscreen)
(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil
   'fullscreen (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))


;; highlight current line color
(global-hl-line-mode 0)

;; disable scrollbars
(set-scroll-bar-mode nil)

(setq linum-format "%3d ")
(setq show-trailing-whitespace t)

;; ace-window
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; magit-filenotify
;; Auto update mode for status buffer
(add-hook 'magit-status-mode-hook 'magit-filenotify-mode)


(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  )

(add-hook 'web-mode-hook  'my-web-mode-hook)
(local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

(add-hook 'js-mode-hook
          (lambda ()
            (make-variable-buffer-local 'tab-width)
            (make-variable-buffer-local 'indent-tabs-mode)
            (make-variable-buffer-local 'whitespace-style)
            (add-hook 'before-save-hook 'whitespace-cleanup nil 'local)
            (setq js-indent-level preferred-javascript-indent-level)
            (setq
             tab-width 2
             indent-tabs-mode t
             whitespace-style '(face tabs spaces trailing lines space-before-tab::tab newline indentation::tab empty space-after-tab::tab space-mark tab-mark newline-mark))))
;; end
