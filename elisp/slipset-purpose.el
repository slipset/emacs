(require 'window-purpose)
(require 'window-purpose-x)
(purpose-x-magit-multi-on)
(purpose-mode)

(add-to-list 'purpose-user-mode-purposes '(clojure-mode . src))
(add-to-list 'purpose-user-mode-purposes '(emacs-lisp-mode . src))
(add-to-list 'purpose-user-mode-purposes '(cider-repl-mode . clj-repl))
(add-to-list 'purpose-user-mode-purposes '(eshell-mode . shells))
(purpose-compile-user-configuration)

(defun load-4k-wide ()
  (purpose-load-frame-layout '4k-wide)
  (balance-windows))

(cond ((eq slipset-display '4k-wide)
       (load-4k-wide)))

(provide 'slipset-purpose)
