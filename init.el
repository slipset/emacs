;; my emacs config

(setq inhibit-startup-screen t)

(setq init-home-dir (file-name-directory user-init-file))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
(add-to-list 'load-path
	     (expand-file-name "elisp" init-home-dir))

(require 'ensure-packages)

(setq ensure-packages
      '(projectile simple-httpd flymake-jslint
		   flymake-cursor git kite magit
		   smart-tabs-mode js2-mode git-gutter-fringe
		   test-case-mode twittering-mode
		   clojure-mode cider
		   markdown-mode
		   auto-complete
		   purty-mode))

(ensure-packages-install-missing)

(load-theme 'bubbleberry)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode t)
(setq-default cursor-type 'bar)
(global-linum-mode)

(require 'js2-mode)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(define-key js2-mode-map (kbd "C-c r") 'kite-reload-page)

(require 'auto-complete-config)
;(require 'kite)
(require 'magit)
(require 'test-case-mode)
(require 'twittering-mode)

;(require 'purty-mode)
;(purty-add-pair '("\\(->\\)" . "→"))
;(purty-add-pair '("\\(->>\\)" . "↠"))



(require 'git-gutter-fringe)

(global-git-gutter-mode +1)

;(require 'smart-mode-line)
;(sml/setup)

(require 'cider)
(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-repl-result-prefix ";; => ")
(setq cider-repl-use-clojure-font-lock t)

(put 'downcase-region 'disabled nil)

(setq split-height-threshold nil)

(setq ediff-split-window-function 'split-window-horizontally)
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
(if (eq system-type 'darwin)
    (progn
      (setq default-input-method "MacOSX")
      (setq mac-option-modifier 'none)
      (setq mac-command-modifier 'meta)))

(defalias 'yes-or-no-p 'y-or-n-p)


(add-to-list 'load-path "~/node/lintnode")
(require 'flymake-jslint)
;; Make sure we can find the lintnode executable
(setq lintnode-location "~/node/lintnode")
;; JSLint can be... opinionated
(setq lintnode-jslint-set "sloppy:true,todo:true,unparam:false")
(setq lintnode-jslint-excludes (list 'nomen 'plusplus 'onevar 'white ))
;; Start the server when we first open a js file and start checking

(add-hook 'js2-mode-hook
          (lambda ()
            (flymake-mode t)
	    (test-case-mode t)
	    (egg-minor-mode)
	    (setq tab-width 4)))

;; (add-hook 'js-mode-hook 'smart-tabs-mode-enable)

(require 'flymake-cursor)

(add-to-list 'load-path "/usr/share/emacs24/site-lisp/git/")
;(require 'git)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 (quote
		("ed5af4af1d148dc4e0e79e4215c85e7ed21488d63303ddde27880ea91112b07e" "33cffbc75316519ccb6da6353e4a39d6c800f66af6003c92876ef37a1af07995" default)))
 '(httpd-port 8848)
 '(js-enabled-frameworks (quote (javascript extjs)))
 '(js2-global-externs (quote ("Ext")))
 '(lintnode-location "~/node/lintnode" t)
 '(lintnode-node-program "nodejs")
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq indent-tabs-mode t) ;; use tabs for indentation

;(autoload 'smart-tabs-mode "smart-tabs-mode"
;   "Intelligently indent with tabs, align with spaces!")
;(autoload 'smart-tabs-mode-enable "smart-tabs-mode")
;(autoload 'smart-tabs-advice "smart-tabs-mode")
;(autoload 'smart-tabs-insinuate "smart-tabs-mode")

;(smart-tabs-advice js-indent-line js-basic-offset)
;(smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python
;                        'ruby 'nxml)
(setq tab-width 4)        ;; set your desired tab width

(require 'projectile)
(add-hook 'js2-mode-hook 'projectile-on)

;; Clojure stuff
(require 'cider)
(setq nrepl-hide-special-buffers t)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'purty-mode)
(setq cider-popup-stacktraces nil)
(setq cider-repl-print-length 100000)
(setq cider-repl-result-prefix ";; => ")
(setq cider-repl-use-clojure-font-lock t)
(setq nrepl-port "4807")
(global-auto-revert-mode 1)

(set-face-attribute 'default nil :height 100)
	
(modify-coding-system-alist 'file "\\.js\\'" 'utf-8-dos)

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(require 'simple-httpd)
(setq httpd-root "~/workspace/")
(httpd-start)

(defun start-chrome ()
  (interactive)
  (start-process "chrome" "*chrome*" "chromium-browser" "--remote-debugging-port=9222"))

(defun kill-chrome ()
  (interactive)
  (start-process "kill chrome" "*kill-chrome*" "killall" "chrome"))

(defun restart-chrome ()
  (interactive)
  (kill-chrome)
  (start-chrome))
  

(defun kite-visit-script (script-info line column after-load-function)
  "Visit the script described by the given SCRIPT-INFO and, once
loaded, move point to LINE and COLUMN and execute
AFTER-LOAD-FUNCTION with the new buffer current.  If a source map
is available, go to the original location instead."
  (interactive)
  (let* ((original-source (kite-script-info--original-source
                           script-info
                           line
                           column))
         (url (plist-get original-source :url))
         (url-parts (url-generic-parse-url url)))
    (flet
     ((after-load ()
                  (goto-char (point-min))
                  (forward-line
                   (1- (plist-get original-source :line)))
                  (beginning-of-line)
                  (forward-char
                   (plist-get original-source :column))
                  (funcall after-load-function)))
	 (debug)
     (cond
      ((string= (url-type url-parts) "file")
       (find-file (url-filename url-parts))
       (after-load))
      (kite-local-root 
       (find-file (kite-find-local-file url-parts))
       (after-load))
      (t
       (switch-to-buffer
        (or (get-buffer url)
            (kite--create-remote-script-buffer
             script-info (function after-load)))))))))

;; sudo apt-get install ttf-inconsolata
(setq font-name "Inconsolata-10")
(when (find-font (font-spec :name font-name))
  (set-default-font font-name))

(setq kite-local-root "~/workspace/prosjekthotell")

(defun kite-find-local-file (url-parts)
  "Returns the local path of a debugged file if some var is set"
  (interactive)
  (progn
    (cond (kite-local-root (concat kite-local-root (car (url-path-and-query url-parts))))
	(t (url-filename url-parts)))))


(defvar test-case-jasmine-font-lock-keywords
  "Keywords to link failures back to"
  (eval-when-compile
    `((,(concat
         `((,(concat "\\_<\\(?:it\\)\\_>")
       (0 'test-case-assertion append))))))))

(defun test-case-jasmine-failure-pattern ()
  "Regexp to match errors in jasmine tests"
  (eval-when-compile
    `(,(concat "^[^ \t]+([^ \t]+) "
               "\\[\\(\\([^:]+\\):\\([[:digit:]]+\\)\\)\\]:\n"
               "\\(\\(.+\n\\)*\\)\n")
      2 3 nil 1 4)))

(defun test-case-jasmine-backend (command)
  "Javascript Jasmine backend for `test-case-mode`"
  (case command
    ('name "Jasmine")
    ('supported (or (derived-mode-p 'js2-mode)
                    (string-match "Test.js" (buffer-file-name))))

    ('command "cd ~/workspace/prosjekthotell; phantomjs app-test/run-jasmine.js jasmine.html")
    ('save t)
    ('failure-pattern (test-case-jasmine-failure-pattern))
    ('font-lock-keywords test-case-jasmine-font-lock-keywords)))

(add-to-list 'test-case-backends 'test-case-jasmine-backend)

(defun build-ctags ()
  (interactive)
  (message "building project tags")
  (let ((root "~/workspace/prosjekthotell/"))
    (shell-command (concat "ctags -e -R --extra=+fq --exclude=.grunt --exclude=build --exclude=lib --exclude=node_modules --exclude=db --exclude=ext --exclude=test --exclude=.git --exclude=public -f " root "TAGS " root)))
  (visit-project-tags)
  (message "tags built successfully"))

(defun visit-project-tags ()
  (interactive)
  (let ((tags-file (concat "~/workspace/prosjekthotell/" "TAGS")))
    (visit-tags-table tags-file)
    (message (concat "Loaded " tags-file))))
(if (eq system-type 'darwin)
    (set-frame-size (selected-frame) 162 54)
  (set-frame-size (selected-frame) 162 80))
  (split-window-horizontally)

(setq default-directory "~/")
