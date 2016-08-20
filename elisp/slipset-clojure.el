(require 'cider)
(require 'clj-refactor)
					;(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-lein-command "/usr/local/bin/lein")
(setq cider-repl-result-prefix ";; => ")
(setq cider-repl-use-clojure-font-lock t)
(setq nrepl-hide-special-buffers t)
(setq cider-popup-stacktraces nil)
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer nil)

(setq cider-repl-print-length 100000)
(setq cider-repl-use-clojure-font-lock t)
(setq nrepl-port "4807")
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'eldoc-mode)

(add-hook 'cider-mode-hook 'enable-paredit-mode)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'clj-refactor-mode)

(provide 'slipset-clojure)

