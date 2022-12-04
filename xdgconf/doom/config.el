;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")
(setq text-quoting-style "grave")
(setq byte-compile-warnings nil)
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


(after! lsp-ui
  (setq lsp-ui-doc-show-with-mouse t)
  (setq lsp-ui-doc-delay 0.01))
(after! org
(setq org-format-latex-options '(:foreground default :background default :scale 0.4 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
             ("begin" "$1" "$" "$$" "\\(" "\\["))

))
(map! :after hydra
      :map evil-window-map
      :desc "open window hydra" "w" #'+hydra/window-nav/body)
(after! treemacs (treemacs-project-follow-mode))
(after! treemacs (setq treemacs-show-cursor t))
(map! :after treemacs
      :map doom-leader-open-map
      :desc "open treemacs" "p" #'treemacs)

;;BIBLIO
  (after! citar
    (setq! citar-bibliography '("~/Documents/Citar/Bib/references.bib"))
    (setq! citar-library-paths '("~/Documents/Citar/Lib"))
    (setq! citar-notes-paths '("~/Documents/Notes")))

(use-package! all-the-icons-completion :after vertico :config (all-the-icons-completion-mode))
(use-package! treemacs-all-the-icons :after treemacs :config (setq doom-themes-treemacs-theme "all-the-icons"))
(use-package! helm-icons :after helm :config (helm-icons-enable))
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 28)) ;;
(setq doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 28)) ;;
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
    )

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (doom/reload-font)
            ))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
