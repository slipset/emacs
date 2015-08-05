(require 'diminish)

(diminish 'global-whitespace-mode)

(diminish 'paredit-mode "pe")
(diminish 'auto-complete-mode)
(diminish 'git-gutter-mode)
(diminish 'yas-minor-mode)

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")
(rename-modeline "clojure-mode" clojure-mode "Clj")

(provide 'slipset-appearance)
