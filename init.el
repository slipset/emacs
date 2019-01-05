;; my emacs config


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:

(package-initialize)

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
				   fill-column-indicator
				   clj-refactor
				   markdown-mode
				   auto-complete
				   yasnippet
				   purty-mode
				   sbt-mode
				   ensime
				   jabber
				   use-package
;				   emacs-eclim
				   atom-dark-theme
				   editorconfig
				   rcirc
				   diminish
				   paredit
				   paredit-menu
				   clojure-snippets
				   restclient
				   window-purpose
				   flycheck-clojure
				   flycheck-pos-tip
				   magithub))

(ensure-packages-install-missing)


(require 'use-package)

(require 'whitespace)
(setq whitespace-style '(face tabs empty trailing))
(global-whitespace-mode 1)

(if (eq system-type 'darwin)
    (require 'slipset-osx))

(if (eq system-type 'windows-nt)
    (require 'slipset-windows-nt))

(require 'flycheck-pos-tip)
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

(require 'slipset-irc)
;(require 'slipset-java)
(require 'slipset-appearance)
(require 'slipset-yasnippet)
(require 'company)
(require 'fill-column-indicator)
(require 'slipset-display)
(require 'slipset-purpose)

(setq fci-rule-color "grey30")
(setq fci-rule-column 80)
(setq fci-handle-truncate-lines nil)
(set-default 'truncate-lines nil)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)


;; ;(require 'eshell)

(setq eshell-prompt-function (lambda nil
    (concat
     (propertize (file-name-nondirectory (eshell/pwd)) 'face `(:foreground "limegreen"))
     (propertize " $ " 'face `(:foreground "limegreen")))))
(setq eshell-highlight-prompt nil)


;; (setq eshell-visual-commands
;;       '("less" "tmux" "htop" "top" "bash" "zsh" "fish"))
;; (setq eshell-visual-subcommands
;;       '(("git" "log" "l" "diff" "show")))
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
(setq-default fringes-outside-margins t)

(add-to-list 'ac-dictionary-directories (concat init-home-dir "ac-dict"))
(ac-config-default)
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
(setq ac-auto-start 2)
(setq ac-ignore-case nil)
(define-key global-map (kbd "RET") 'newline-and-indent)

(setq projectile-keymap-prefix (kbd "C-c p"))

(require 'projectile)
(projectile-global-mode)
(setq projectile-mode-line '(:eval (format " [%s]" (projectile-project-name))))
(setq projectile-globally-ignored-file-suffixes '("#~"))


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
 '(inf-clojure-lein-cmd "planck --theme dark")
 '(inf-clojure-program "planck --theme dark")
 '(markdown-fontify-code-blocks-natively t)
 '(package-selected-packages
   (quote
    (racket-mode flycheck-pos-tip flycheck-clojure use-package company-restclient restclient window-purpose slack vue-html-mode vue-mode htmlize twittering-mode solarized-theme smart-tabs-mode simple-httpd scala-mode2 purty-mode projectile paredit-menu magit kite js2-mode jabber inf-clojure git-gutter-fringe git flymake-jslint flymake-cursor ensime editorconfig diminish clojure-snippets clojure-mode-extra-font-locking clj-refactor auto-complete atom-dark-theme)))
 '(safe-local-variable-values
   (quote
    ((eval progn
	   (setenv "RSA_PRIVATE_KEY_PATH" "/Users/erik/Documents/ardoq.com/ardoq-api/dev-resources/rsakey/key.pem")
	   (setenv "RSA_PUBLIC_KEY_PATH" "/Users/erik/Documents/ardoq.com/ardoq-api/dev-resources/rsakey/key.pub")
	   (setenv "MANDRILL_API_KEY" "hlICKC9alBnarSoUzGMNiA")
	   (setenv "MAIL_PROVIDER" "mandrill")
	   (setenv "CHARGEBEE_SITE" "ardoq-test")
	   (setenv "CHARGEBEE_API_KEY" "test_07MgrcuH98zPmBTkJTNWjdMZZGOZahccuZ"))
     (js2-strict-missing-semi-warning nil)
     (cider-cljs-lein-repl . "(start-cljs)")
     (checkdoc-package-keywords-flag)
     (bug-reference-bug-regexp . "#\\(?2:[[:digit:]]+\\)")
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
 '(markdown-code-face ((t (:inherit monoid))))
 '(mode-line ((t (:background "grey12" :foreground "#96CBFE"))))
 '(mode-line-buffer-id ((t (:weight normal :foreground "red")))))
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(add-to-list 'company-backends 'company-restclient)

(defun add-auto-mode (mode &rest patterns)
  "Associate every pattern in `PATTERNS' with `MODE'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun prevent-whitespace-mode-for-magit ()
  (not (derived-mode-p 'magit-mode)))

(add-function :before-while whitespace-enable-predicate 'prevent-whitespace-mode-for-magit)

(use-package magithub
  :after magit
  :ensure t
  :config (magithub-feature-autoinject t))
