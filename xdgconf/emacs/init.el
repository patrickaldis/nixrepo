;; Reqired Packages
(setq use-package-always-ensure t)

(use-package magit)

(use-package git-gutter
  :config
  (add-hook 'prog-mode-hook 'git-gutter-mode)
  (setq git-gutter:update-interval 0.02)

  (use-package git-gutter-fringe
    :config
    (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
    (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
    (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom)))

(use-package projectile
  :config
  (projectile-mode +1))

;; Keymap
(global-set-key (kbd "C-x p p") 'projectile-switch-project)
(global-set-key (kbd "C-x p f") 'projectile-find-file)

(global-unset-key (kbd "C-x o"))
(global-set-key (kbd "C-x o p") 'treemacs)
(global-set-key (kbd "C-x o t") 'vterm)


(use-package autothemer
  :init (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  :config (load-theme 'catppuccin-frappe t))

;; PROJECT VIEWER
(use-package treemacs
  :config
  (use-package treemacs-all-the-icons
    :init (use-package all-the-icons)
    :config (treemacs-load-theme "all-the-icons"))
  (use-package treemacs-projectile
    :config (treemacs-project-follow-mode 1))
  (use-package treemacs-magit))

(use-package doom-modeline :config (doom-modeline-mode 1))

(use-package vterm)

(use-package avy)
(use-package counsel 
  :config
    (counsel-mode))
    ;; (use-package counsel-projectile :config (counsel-projectile-mode)))
(use-package ivy
    :config
    (ivy-mode 1)
    (use-package ivy-rich
      :init 
      :config
      (ivy-rich-mode 1)
      (use-package all-the-icons-ivy-rich
	:init (use-package all-the-icons)
	:config (all-the-icons-ivy-rich-mode 1)))
    (use-package ivy-prescient
      :init (use-package prescient :config (prescient-persist-mode 1))
      :config (ivy-prescient-mode) (setq ivy-prescient-retain-classic-highlighting t))
    
    (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
    :bind (:map ivy-minibuffer-map
		("C-j" . ivy-next-line)
		("C-k" . ivy-previous-line)))

(use-package direnv
  :config
  (setq direnv-always-show-summary nil)
  (direnv-mode)
  )

;;COMPANY
(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0))

(use-package flycheck
  :config (add-hook 'after-init-hook 'global-flycheck-mode))

;; LSP
(use-package lsp-mode
  :after (evil direnv)
  :config
  (use-package lsp-ui)
  (use-package lsp-haskell
    :init (use-package haskell-mode)
    :config
    (add-hook 'haskell-mode-hook #'lsp-deferred)
    (add-hook 'haskell-literate-mode-hook #'lsp))
  
  (setq gc-cons-threshold 1000000000)
  (setq read-process-output-max (* 1024 1024)))

(use-package haskell-mode)
(use-package nix-mode :config (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode)))
(use-package fish-mode)

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (use-package evil-collection :config (evil-collection-init))
  
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-insert-state-map (kbd "C-u")
    (lambda ()
      (interactive)
      (evil-delete (point-at-bol) (point))))
  (use-package evil-leader
    :config
    (define-key evil-motion-state-map (kbd "SPC") nil)
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      "f" 'counsel-find-file
      "p" 'projectile-switch-project
      "b" 'ivy-switch-buffer
      "g" 'magit
      "t" 'vterm
      "SPC" 'projectile-find-file)))

;; UI
;; FONT
(setq default-frame-alist '((font . "JetBrainsMono Nerd Font Mono 10")))
(set-frame-font "JetBrainsMono Nerd Font Mono 10" nil t)
(dolist (char/ligature-re
         `((?-  . ,(rx (or (or "-->" "-<<" "->>" "-|" "-~" "-<" "->") (+ "-"))))
           (?/  . ,(rx (or (or "/==" "/=" "/>" "/**" "/*") (+ "/"))))
           (?*  . ,(rx (or (or "*>" "*/") (+ "*"))))
           (?<  . ,(rx (or (or "<<=" "<<-" "<|||" "<==>" "<!--" "<=>" "<||" "<|>" "<-<"
                               "<==" "<=<" "<-|" "<~>" "<=|" "<~~" "<$>" "<+>" "</>"
                               "<*>" "<->" "<=" "<|" "<:" "<>"  "<$" "<-" "<~" "<+"
                               "</" "<*")
                           (+ "<"))))
           (?:  . ,(rx (or (or ":?>" "::=" ":>" ":<" ":?" ":=") (+ ":"))))
           (?=  . ,(rx (or (or "=>>" "==>" "=/=" "=!=" "=>" "=:=") (+ "="))))
           (?!  . ,(rx (or (or "!==" "!=") (+ "!"))))
           (?>  . ,(rx (or (or ">>-" ">>=" ">=>" ">]" ">:" ">-" ">=") (+ ">"))))
           (?&  . ,(rx (+ "&")))
           (?|  . ,(rx (or (or "|->" "|||>" "||>" "|=>" "||-" "||=" "|-" "|>"
                               "|]" "|}" "|=")
                           (+ "|"))))
           (?.  . ,(rx (or (or ".?" ".=" ".-" "..<") (+ "."))))
           (?+  . ,(rx (or "+>" (+ "+"))))
           (?\[ . ,(rx (or "[<" "[|")))
           (?\{ . ,(rx "{|"))
           (?\? . ,(rx (or (or "?." "?=" "?:") (+ "?"))))
           (?#  . ,(rx (or (or "#_(" "#[" "#{" "#=" "#!" "#:" "#_" "#?" "#(")
                           (+ "#"))))
           (?\; . ,(rx (+ ";")))
           (?_  . ,(rx (or "_|_" "__")))
           (?~  . ,(rx (or "~~>" "~~" "~>" "~-" "~@")))
           (?$  . ,(rx "$>"))
           (?^  . ,(rx "^="))
           (?\] . ,(rx "]#"))))
  (let ((char (car char/ligature-re))
        (ligature-re (cdr char/ligature-re)))
    (set-char-table-range composition-function-table char
                          `([,ligature-re 0 font-shape-gstring]))))

;; SCROLLING
(pixel-scroll-precision-mode 1)
(setq scroll-conservatively 101)

;; HIDE UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;; THEME
;; (use-package dracula-theme :init (load-theme 'dracula t)) 

;; EDITOR
(add-hook 'text-mode-hook 'display-line-numbers-mode) ;; DISPLAY LINE NOS
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; DISPLAY LINE NOS
(global-hl-line-mode 1) ;; HIGHLIGHT LINES
(set-default 'truncate-lines 0) ;; DO NOT WRAP
(defalias 'yes-or-no-p 'y-or-n-p)

;; BACKUPS
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
    )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-variable-name-face ((t (:foreground "sky blue" :weight bold)))))
