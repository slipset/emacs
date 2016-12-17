(setq default-input-method "MacOSX")
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)
(set-frame-size (selected-frame) 162 54)

(setq slipset-eclim-executable "/Applications/eclipse/eclim")
(setq slipset-eclim-eclipse-dirs '("/Applications/eclipse"))

(setq slipset-font-family "Monoid")
(when (window-system)
  (set-default-font slipset-font-family))
(mac-auto-operator-composition-mode)
(setq slipset-edconf-exec-path "/usr/local/bin/editorconfig")

(cond ((and (= 2560 (display-pixel-width))
	    (= 1440 (display-pixel-height)))
       (set-face-attribute 'default nil :height 110)))


(provide 'slipset-osx)
