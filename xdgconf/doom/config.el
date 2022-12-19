;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Patrick Aldis"
      user-mail-address "patrick.aldis@virginmeda.com")

;; GENERAL OPTIONS ------------------------------------------------------------
(setq display-line-numbers-type t)              ;; Display line numbers
(setq doom-modeline-major-mode-icon t)          ;; Show icon in modeline
(setq text-quoting-style "grave")               ;; Errrrr `' - I think ?

;; THEME
(setq doom-theme 'doom-one)                     ;; Theme :)

;; FONTS
(setq fontsize 28)
(setq doom-font                                 ;; Monospaced Font
      (font-spec :family "JetBrainsMono Nerd Font Mono"
                 :size fontsize))
(setq doom-variable-pitch-font                  ;; Non-mono (Treemacs)
      (font-spec :family "JetBrainsMono Nerd Font Mono"
                 :size fontsize))

;; BACKUPS
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
)

;; EDITOR ----------------------------------------------------------------------
;; TREEMACS
(after! treemacs
  (treemacs-project-follow-mode)                ;; Projectile/Treemacs switch
  (setq treemacs-show-cursor t)                 ;; Show Cursor
  (use-package! treemacs-all-the-icons          ;; Enable icons
    :config (setq doom-themes-treemacs-theme "all-the-icons"))
)

;; VERTICO
(after! vertico
  (use-package! all-the-icons-completion        ;; Enable Icons
    :config (all-the-icons-completion-mode))
)

;; CODE ------------------------------------------------------------------------
;; LSP
(after! lsp-ui
  (setq lsp-ui-doc-show-with-mouse t)   ;; Override doom's default hiding hover
  (setq lsp-ui-doc-delay 0.01)          ;; Show docs instantly
)
(map! :leader                           ;; Currently SPC c f doesn't work - FIX
      :desc "Format Buffer" "c f" #'lsp-format-buffer
)

;; WHITESPACE
(after! whitespace
  (setq whitespace-style
        '(face
          tabs
          tab-mark
          spaces
          space-mark
          trailing
          lines-tail
          indentation))
  (global-whitespace-mode t))

;; AVY
(after! avy
  (use-package! avy-flycheck
    :config
    (map! :desc "avy goto lens" :n "g s L" #'lsp-avy-lens
          :desc "avy goto lens" :n "g s l" #'avy-goto-line
          :desc "avy goto error" :n "g s e" #'avy-flycheck-goto-error)
  )
)

;; ORG MODE OPTIONS ------------------------------------------------------------
(after! org
  ;; GENERAL
  ;; Org Directories
  (setq org-directory "~/Documents/Notes")
  (setq org-agenda-files "~/Documents/Notes/Agenda")
  ;; rename export directory to "export"
  (defadvice org-export-output-file-name (before org-add-export-dir activate)
    (when (not pub-dir)
      (setq pub-dir "exports")
      (when (not (file-directory-p pub-dir))
        (make-directory pub-dir))))

  ;; LATEX PREVIEW
  ;; Make scale smaller
  (setq org-format-latex-options '(:foreground deafult
                                   :background default
                                   :scale 0.4
                                   :html-foreground "Black"
                                   :html-background "Transparent"
                                   :html-scale 1.0
                                   :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
  ;; Render as SVG
  (setq org-preview-latex-default-process 'dvisvgm)
)

;;BIBLIO
(after! citar
  (setq! citar-bibliography '("~/Documents/Citar/Bib/references.bib"))
  (setq! citar-library-paths '("~/Documents/Citar/Lib"))
  (setq! citar-notes-paths '("~/Documents/Notes"))
)

;;"I'm not really sure if these options do anything"
;; (use-package! helm-icons :after helm :config (helm-icons-enable))
;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (doom/reload-font)
;;             ))
;; (setq byte-compile-warnings nil)
