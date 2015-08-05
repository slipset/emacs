;; my emacs config

(setq inhibit-startup-screen t)

(setq init-home-dir (file-name-directory user-init-file))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
												 ("melpa" . "http://melpa.org/packages/")))
(add-to-list 'load-path
						 (expand-file-name "elisp" init-home-dir))

(require 'slipset-funs)
(require 'ensure-packages)

(setq ensure-packages
      '(projectile simple-httpd flymake-jslint
									 flymake-cursor git kite magit
									 smart-tabs-mode js2-mode git-gutter-fringe
									 twittering-mode
									 auto-complete
									 clojure-mode cider
									 markdown-mode
									 auto-complete
									 yasnippet
									 purty-mode
									 sbt-mode
									 ensime
									 jabber
									 emacs-eclim
									 atom-dark-theme
									 editorconfig
									 rcirc
									 diminish
									 paredit-menu
									 clojure-snippets))

(ensure-packages-install-missing)

(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face tabs empty trailing lines-tail))
(global-whitespace-mode 1)

(if (eq system-type 'darwin)
		(require 'slipset-osx))

(if (eq system-type 'windows-nt)
		(require 'slipset-windows-nt))

(require 'paredit-menu)
(require 'flymake-cursor)
(require 'editorconfig)
(require 'auto-complete-config)
(require 'slipset-git)
(require 'slipset-clojure)
(require 'slipset-javascript)
(require 'slipset-scala)
(require 'slipset-display)
(require 'slipset-irc)
(require 'slipset-java)
(require 'slipset-appearance)
(require 'slipset-yasnippet)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode t)
(display-time-mode t)
(setq display-time-24hr-format t)
(setq-default cursor-type 'bar)
(global-linum-mode)
(setq linum-format "%4d\u2502")
(put 'downcase-region 'disabled nil)
(setq split-height-threshold nil)
(setq ediff-split-window-function 'split-window-horizontally)

(add-to-list 'ac-dictionary-directories (concat init-home-dir "ac-dict"))
(ac-config-default)
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
(setq ac-auto-start 2)
(setq ac-ignore-case nil)
(define-key global-map (kbd "RET") 'newline-and-indent)

(setq tab-width 4)

(require 'projectile)
(projectile-global-mode)
(setq projectile-mode-line '(:eval (format " [%]" (projectile-project-name))))

(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 (quote
		("90d329edc17c6f4e43dbc67709067ccd6c0a3caa355f305de2041755986548f2" "ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "33cffbc75316519ccb6da6353e4a39d6c800f66af6003c92876ef37a1af07995" default)))
 '(eclim-eclipse-dirs (quote ("/Applications/eclipse")))
 '(eclim-executable "/Applications/eclipse/eclim")
 '(edconf-exec-path "C:\\Program Files (x86)\\editorconfig\\bin\\editorconfig")
 '(httpd-port 8848)
 '(safe-local-variable-values (quote ((whitespace-cleanup-mode . t))))
 '(tab-width 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-auto-revert-mode 1)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

(setq default-directory "~/")

(require 'jabber)


(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
