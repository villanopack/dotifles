(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have
(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))
