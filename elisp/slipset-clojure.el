(require 'cider)
(require 'clj-refactor)
					;(setq cider-repl-pop-to-buffer-on-connect nil)

(eval-after-load 'flycheck '(flycheck-clojure-setup))
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

(setq cider-lein-command "/usr/local/bin/lein")
(setq cider-repl-result-prefix ";; => ")
(setq cider-repl-use-clojure-font-lock t)
(setq nrepl-hide-special-buffers nil)
(setq cider-popup-stacktraces nil)
(setq cider-show-error-buffer nil)
(setq cider-auto-select-error-buffer nil)
(setq cider-repl-use-pretty-printing t)
(setq cider-repl-print-length 1000)
(setq cider-repl-use-clojure-font-lock t)
(setq nrepl-port "4807")
(setq cljr-warn-on-eval nil)
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'eldoc-mode)

(add-hook 'cider-mode-hook 'enable-paredit-mode)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'clj-refactor-mode)

(defun setup-cljr ()
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'setup-cljr)

(setq-default flycheck-disabled-checkers '(clojure-cider-typed))

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))
					;(setq clojure-indent-style :always-indent)

(provide 'slipset-clojure)
