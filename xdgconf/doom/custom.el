(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c865644bfc16c7a43e847828139b74d1117a6077a845d16e71da38c8413a5aaa" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a" "512ce140ea9c1521ccaceaa0e73e2487e2d3826cc9d287275550b47c04072bc4" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "016f665c0dd5f76f8404124482a0b13a573d17e92ff4eb36a66b409f4d1da410" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" default))
 '(ein:output-area-inlined-images t)
 '(org-display-remote-inline-images 'download))
 ;; '(org-format-latex-options
 ;;   '(:foreground default :background default :scale 0.4 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
 ;;     ("begin" "$1" "$" "$$" "\\(" "\\["))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'customize-group 'disabled nil)

;; (dolist (char/ligature-re
;;          `((?-  . ,(rx (or (or "-->" "-<<" "->>" "-|" "-~" "-<" "->") (+ "-"))))
;;            (?/  . ,(rx (or (or "/==" "/=" "/>" "/**" "/*") (+ "/"))))
;;            (?*  . ,(rx (or (or "*>" "*/") (+ "*"))))
;;            (?<  . ,(rx (or (or "<<=" "<<-" "<|||" "<==>" "<!--" "<=>" "<||" "<|>" "<-<"
;;                                "<==" "<=<" "<-|" "<~>" "<=|" "<~~" "<$>" "<+>" "</>"
;;                                "<*>" "<->" "<=" "<|" "<:" "<>"  "<$" "<-" "<~" "<+"
;;                                "</" "<*")
;;                            (+ "<"))))
;;            (?:  . ,(rx (or (or ":?>" "::=" ":>" ":<" ":?" ":=") (+ ":"))))
;;            (?=  . ,(rx (or (or "=>>" "==>" "=/=" "=!=" "=>" "=:=") (+ "="))))
;;            (?!  . ,(rx (or (or "!==" "!=") (+ "!"))))
;;            (?>  . ,(rx (or (or ">>-" ">>=" ">=>" ">]" ">:" ">-" ">=") (+ ">"))))
;;            (?&  . ,(rx (+ "&")))
;;            (?|  . ,(rx (or (or "|->" "|||>" "||>" "|=>" "||-" "||=" "|-" "|>"
;;                                "|]" "|}" "|=")
;;                            (+ "|"))))
;;            (?.  . ,(rx (or (or ".?" ".=" ".-" "..<") (+ "."))))
;;            (?+  . ,(rx (or "+>" (+ "+"))))
;;            (?\[ . ,(rx (or "[<" "[|")))
;;            (?\{ . ,(rx "{|"))
;;            (?\? . ,(rx (or (or "?." "?=" "?:") (+ "?"))))
;;            (?#  . ,(rx (or (or "#_(" "#[" "#{" "#=" "#!" "#:" "#_" "#?" "#(")
;;                            (+ "#"))))
;;            (?\; . ,(rx (+ ";")))
;;            (?_  . ,(rx (or "_|_" "__")))
;;            (?~  . ,(rx (or "~~>" "~~" "~>" "~-" "~@")))
;;            (?$  . ,(rx "$>"))
;;            (?^  . ,(rx "^="))
;;            (?\] . ,(rx "]#"))))
;;   (let ((char (car char/ligature-re))
;;         (ligature-re (cdr char/ligature-re)))
;;     (set-char-table-range composition-function-table char
;;                           `([,ligature-re 0 font-shape-gstring]))))
