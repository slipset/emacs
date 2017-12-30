(require 'window-purpose)
(require 'window-purpose-x)
(purpose-x-magit-multi-on)
(purpose-mode)

(add-to-list 'purpose-user-mode-purposes '(clojure-mode . src))
(add-to-list 'purpose-user-mode-purposes '(emacs-lisp-mode . src))
(add-to-list 'purpose-user-mode-purposes '(cider-repl-mode . clj-repl))
(add-to-list 'purpose-user-mode-purposes '(eshell-mode . shells))
(purpose-compile-user-configuration)

(defun load-layout (layout)
  (purpose-load-frame-layout layout)
  (balance-windows))

(load-layout '4k-wide)

(provide 'slipset-purpose)
