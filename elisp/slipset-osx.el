
(setq default-input-method "MacOSX")
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)


(setq slipset-eclim-executable "/Applications/eclipse/eclim")
(setq slipset-eclim-eclipse-dirs '("/Applications/eclipse"))

(setq slipset-font-family "-*-Monoid-light-normal-semicondensed-*-*-*-*-*-m-0-iso10646-1")

(when (boundp 'mac-auto-operator-composition-mode)
  (mac-auto-operator-composition-mode))

(setq slipset-edconf-exec-path "/usr/local/bin/editorconfig")

(provide 'slipset-osx)
