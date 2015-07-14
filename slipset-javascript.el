(require 'js2-mode)
(require 'flymake-jslint)

(modify-coding-system-alist 'file "\\.js\\'" 'utf-8)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'load-path "~/node/lintnode")

(setq 'js-enabled-frameworks '(javascript extjs angular))
;; Make sure we can find the lintnode executable
(setq lintnode-location "~/node/lintnode")
;; JSLint can be... opinionated
(setq lintnode-jslint-set "sloppy:true,todo:true,unparam:false")
(setq lintnode-jslint-excludes (list 'nomen 'plusplus 'onevar 'white ))
;; Start the server when we first open a js file and start checking

(add-hook 'js2-mode-hook
          (lambda ()
            (flymake-mode t)))

;; (add-hook 'js-mode-hook 'smart-tabs-mode-enable)


(provide 'slipset-javascript)
