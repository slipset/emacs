(put 'downcase-region 'disabled nil)
(add-to-list 'load-path "/Users/erik/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/erik/.emacs.d/ac-dict")
(ac-config-default)


; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

 (define-key global-map (kbd "RET") 'newline-and-indent)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(require 'projectile)
(projectile-global-mode)
(setq tab-width 4)
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
