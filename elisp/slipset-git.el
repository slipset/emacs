(require 'magit)
(require 'git-gutter-fringe)

(global-git-gutter-mode +1)
(add-hook 'git-gutter:update-hooks 'magit-revert-buffer-hook)
(global-set-key (kbd "C-x C-g") 'magit-status)
(add-to-list 'load-path "/usr/share/emacs24/site-lisp/git/")

(provide 'slipset-git)
