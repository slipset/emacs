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

(provide 'slipset-scala)
