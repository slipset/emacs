(require 'eclim)
(require 'eclimd)
(require 'company-emacs-eclim)

(global-eclim-mode)

(company-emacs-eclim-setup)

(setq eclim-eclipse-dirs slipset-eclim-eclipse-dirs)
(setq eclim-executable slipset-eclim-executable)
(setq eclimd-wait-for-process nil)

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(provide 'slipset-java)
