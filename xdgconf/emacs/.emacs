;; Reqired Packages
(require 'magit)

(require 'projectile)
(projectile-mode +1)

;; PROJECT VIEWER
(require 'all-the-icons)

;; (require 'neotree)
;; (setq neo-theme 'icons)
;; (setq projectile-switch-project-action 'neotree-projectile-action)

(require 'treemacs)
(require 'treemacs-all-the-icons)
(treemacs-load-theme "all-the-icons")

(require 'doom-modeline)
(doom-modeline-mode 1)

(require 'vterm)

;; LSP
(require 'lsp-mode)
(require 'lsp-haskell)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

(setq evil-want-keybinding nil)
(require 'evil-collection)
(evil-collection-init)

(require 'evil)
(evil-mode 1)

;; UI
;; FONT
(set-face-attribute 'default t :font "JetBrainsMono Nerd Font Mono" )

;; SCROLLING
(pixel-scroll-precision-mode 1)
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
