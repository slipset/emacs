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
		   auto-complete
		   clojure-mode cider
		   markdown-mode
		   auto-complete
		   purty-mode))

(ensure-packages-install-missing)

;(load-theme 'bubbleberry)
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
<<<<<<< HEAD
    ("53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "57f8801351e8b7677923c9fe547f7e19f38c99b80d68c34da6fa9b94dc6d3297" "33a15e00c2d5e1868d9880984ca33f9b6a5d195cfd55a021b8c182294ff8dc28" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "fa942713c74b5ad27893e72ed8dccf791c9d39e5e7336e52d76e7125bfa51d4c" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "3d568788393420c93d778df9a46c59b81dd5d9acabaf3b5962659bc0772012aa" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "1a85b8ade3d7cf76897b338ff3b20409cb5a5fbed4e45c6f38c98eee7b025ad4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "33cffbc75316519ccb6da6353e4a39d6c800f66af6003c92876ef37a1af07995" default)))
 '(eclim-eclipse-dirs (quote ("/Applications/eclipse")))
 '(eclim-executable "/Applications/eclipse/eclim")
=======
    ("33cffbc75316519ccb6da6353e4a39d6c800f66af6003c92876ef37a1af07995" default)))
>>>>>>> 0991a2b7cebf65f26bcd55e218fddd58a937d4cb
 '(httpd-port 8848)
 '(js-enabled-frameworks (quote (javascript extjs)))
 '(js2-global-externs (quote ("Ext")))
 '(lintnode-location "~/node/lintnode" t)
<<<<<<< HEAD
 '(lintnode-node-program "nodejs")
 '(rcirc-default-full-name "Erik Assum")
 '(rcirc-default-nick "slipset")
 '(tool-bar-mode nil)
 '(yas-global-mode t nil (yasnippet)))
=======
 '(lintnode-node-program "nodejs"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
>>>>>>> 0991a2b7cebf65f26bcd55e218fddd58a937d4cb

;(setq indent-tabs-mode t) ;; use tabs for indentation

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
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)

(global-auto-revert-mode 1)

(set-face-attribute 'default nil :height 100)
	
(modify-coding-system-alist 'file "\\.js\\'" 'utf-8)

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

(require 'sbt-mode)
(require 'ensime)
(setq ensime-ac-override-settings t)
(setq ensime-auto-connect t)
(setq exec-path (append exec-path (list "/usr/local/bin" )))
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(defun eval-last-scala-expr ()
  (interactive)
  (let ((start (point)))
    (save-excursion
      (backward-sexp)
      (beginning-of-line)
      (ensime-inf-eval-region start (point)))))

(defun my-ensime-mode-hook ()
  (interactive)
    (define-key ensime-mode-map (kbd "C-c C-r") 'ensime-inf-eval-region)
    (define-key ensime-mode-map (kbd "M-e") 'ensime-inf-eval-region)
    (define-key ensime-mode-map (kbd "C-c C-v b") 'ensime-inf-eval-buffer)
    (define-key ensime-mode-map (kbd "C-c C-v l") 'ensime-inf-load-file)    
    (define-key ensime-mode-map (kbd "C-x C-e") 'eval-last-scala-expr)
    (define-key ensime-mode-map (kbd "C-c C-b s") 'ensime-sbt-switch)
    (define-key ensime-mode-map (kbd "C-c C-b S") 'ensime-stacktrace-switch)
    (define-key ensime-mode-map (kbd "C-c C-b c") 'ensime-sbt-do-compile)
    (define-key ensime-mode-map (kbd "C-c C-b n") 'ensime-sbt-do-clean)
    (define-key ensime-mode-map (kbd "C-c C-b p") 'ensime-sbt-do-package)
    (define-key ensime-mode-map (kbd "C-c C-b t") 'ensime-sbt-do-test-quick))

(add-hook 'ensime-mode-hook 'my-ensime-mode-hook)


(load-theme 'bubbleberry)
(set-face-attribute 'default nil :height 130)
(set-face-attribute 'default nil :family "Monaco")
(toggle-frame-maximized)
(require 'yasnippet)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'jabber)
(require 'eclim)
(require 'eclimd)
(global-eclim-mode)

(require 'company-emacs-eclim)
(company-emacs-eclim-setup)

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(setq rcirc-omit-responses '("JOIN" "PART" "QUIT" "NICK" "AWAY")) 

(add-to-list 'rcirc-server-alist
	     '("irc.freenode.net"
	       :channels ("#clojure")))

(setq rcirc-authinfo
      '(("freenode" nickserv "slipset" "5l1p53t")))
