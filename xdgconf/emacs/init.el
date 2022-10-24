;; Reqired Packages
(require 'magit)

(require 'git-gutter)
(add-hook 'prog-mode-hook 'git-gutter-mode) 
(setq git-gutter:update-interval 0.02)
(require 'git-gutter-fringe)
(define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom)


(require 'projectile)
(projectile-mode +1)

;; PROJECT VIEWER
(require 'all-the-icons)

;; (require 'neotree)
;; (setq neo-theme 'icons)
;; (setq projectile-switch-project-action 'neotree-projectile-action)

(require 'treemacs)
(require 'treemacs-all-the-icons)
(require 'treemacs-magit)
(require 'treemacs-projectile)
(treemacs-load-theme "all-the-icons")
(treemacs-project-follow-mode 1)

(require 'doom-modeline)
(doom-modeline-mode 1)

(require 'vterm)

(require 'avy)
(require 'ivy)
(require 'ivy-rich)

(ivy-mode 1)
(ivy-rich-mode 1)
(all-the-icons-ivy-rich-mode 1)
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)

(require 'direnv)
(direnv-mode)

;;COMPANY
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)

(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

;; LSP
(require 'lsp-mode)
(require 'lsp-ui)

(require 'haskell-mode)
(require 'lsp-haskell)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

(require 'fish-mode)

(setq evil-want-keybinding nil)
(require 'evil-collection)
(evil-collection-init)

(require 'evil)
(evil-mode 1)

;; UI
;; FONT
(set-frame-font "JetBrainsMono Nerd Font Mono 20" nil t)
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
;(pixel-scroll-precision-mode 1)
(setq scroll-conservatively 101)

;; HIDE UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;; THEME
(load-theme 'dracula t)

;; EDITOR
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; DISPLAY LINE NOS
(global-hl-line-mode 1) ;; HIGHLIGHT LINES
(set-default 'truncate-lines 0) ;; DO NOT WRAP
(defalias 'yes-or-no-p 'y-or-n-p)

(require 'evil-leader)

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
