;; my emacs config

(setq inhibit-startup-screen t)

(setq init-home-dir (file-name-directory user-init-file))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
(add-to-list 'load-path
	     (expand-file-name "elisp" init-home-dir))

(require 'slipset-funs)
(require 'ensure-packages)

(setq ensure-packages '(projectile simple-httpd flymake-jslint
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
				   paredit
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

(require 'yasnippet)
(require 'paredit)
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

(require 'eshell)

(setq eshell-visual-commands
      '("less" "tmux" "htop" "top" "bash" "zsh" "fish"))
(setq eshell-visual-subcommands
      '(("git" "log" "l" "diff" "show")))
(tool-bar-mode -1)
(menu-bar-mode 1)
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


(require 'projectile)
(projectile-global-mode)
(setq projectile-mode-line '(:eval (format " [%s]" (projectile-project-name))))

(defalias 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "red3" "green3" "yellow3" "SkyBlue1" "magenta3" "cyan3" "gray90"])
 '(custom-safe-themes
   (quote
    ("a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(httpd-port 8848)
 '(inf-clojure-program "planck --theme dark")
 '(safe-local-variable-values
   (quote
    ((bug-reference-bug-regexp . "#\\(?2:[[:digit:]]+\\)")
     (whitespace-cleanup-mode . t)))))

(global-auto-revert-mode 1)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

(setq default-directory "~/")

(require 'jabber)

(setq edconf-exec-path slipset-edconf-exec-path)

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(breakpoint-enabled ((t (:foreground "red1" :weight normal))))
 '(buffer-menu-buffer ((t (:weight normal))))
 '(custom-variable-tag ((t (:foreground "light blue" :weight normal))))
 '(font-lock-warning-face ((t (:foreground "#ff982d" :weight normal))))
 '(magit-diff-file-heading ((t (:weight normal))))
 '(magit-section-heading ((t (:foreground "LightGoldenrod2" :weight normal))))
 '(mode-line ((t (:background "grey12" :foreground "#96CBFE"))))
 '(mode-line-buffer-id ((t (:weight normal)))))
(put 'narrow-to-region 'disabled nil)
