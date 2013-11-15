(setq init-home-dir "~/.emacs.d/")

(add-to-list 'load-path init-home-dir)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(require 'ensure-packages)
(setq ensure-packages
      '(projectile simple-httpd flymake-jslint flymake-cursor git kite magit smart-tabs-mode))

(ensure-packages-install-missing)

(load-theme 'tango-dark)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq-default cursor-type 'bar)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


(require 'auto-complete-config)
(require 'kite)
(require 'magit)
(put 'downcase-region 'disabled nil)


(add-to-list 'ac-dictionary-directories (concat init-home-dir "ac-dict"))
(ac-config-default)


; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

 (define-key global-map (kbd "RET") 'newline-and-indent)

(require 'projectile)
(projectile-global-mode)
(setq tab-width 4)
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(defalias 'yes-or-no-p 'y-or-n-p)


(add-to-list 'load-path "~/node/lintnode")
(require 'flymake-jslint)
;; Make sure we can find the lintnode executable
(setq lintnode-location "~/node/lintnode")
;; JSLint can be... opinionated
(setq lintnode-jslint-set "sloppy:true,todo:true")
(setq lintnode-jslint-excludes (list 'nomen 'plusplus 'onevar 'white ))
;; Start the server when we first open a js file and start checking

(add-hook 'js2-mode-hook
          (lambda ()
            (flymake-mode t)
			(setq tab-width 4)))

;; (add-hook 'js-mode-hook 'smart-tabs-mode-enable)

(require 'flymake-cursor)

(add-to-list 'load-path "/usr/share/emacs24/site-lisp/git/")
(require 'git)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(httpd-port 8848)
 '(js-enabled-frameworks (quote (javascript extjs)))
 '(js2-global-externs (quote ("Ext")))
 '(lintnode-location "~/node/lintnode")
 '(lintnode-node-program "nodejs"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq indent-tabs-mode t) ;; use tabs for indentation

(autoload 'smart-tabs-mode "smart-tabs-mode"
   "Intelligently indent with tabs, align with spaces!")
(autoload 'smart-tabs-mode-enable "smart-tabs-mode")
(autoload 'smart-tabs-advice "smart-tabs-mode")
(autoload 'smart-tabs-insinuate "smart-tabs-mode")

(smart-tabs-advice js-indent-line js-basic-offset)
(smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python
                        'ruby 'nxml)
(setq tab-width 4)        ;; set your desired tab width
(require 'projectile)
(add-hook 'js2-mode-hook 'projectile-on)


(global-auto-revert-mode 1)

(set-face-attribute 'default nil :height 80)
	
(modify-coding-system-alist 'file "\\.js\\'" 'utf-8-dos)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(require 'simple-httpd)
(setq httpd-root "~/workspace/")
(httpd-start)

(defun start-chrome ()
  (interactive)
  (start-process "chrome" "*chrome*" "chromium-browser" "--remote-debugging-port=9222" "--url http://localhost/index.html"))

(defun kill-chrome ()
  (interactive)
  (start-process "kill chrome" "*kill-chrome*" "killall" "chrome"))

(defun restart-chrome ()
  (interactive)
  (kill-chrome)
  (start-chrome))
  
