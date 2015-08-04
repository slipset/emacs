(set-frame-size (selected-frame) 162 80)
(split-window-horizontally)

(setq screen-width (x-display-pixel-width))
(setq screen-height (x-display-pixel-height))
(set-face-attribute 'default nil :family slipset-font-family)

(cond
 ((eq 1050 screen-height) (set-face-attribute 'default nil :height 100))
 ((eq 1200 screen-height) (set-face-attribute 'default nil :height 120))
 ('t (set-face-attribute 'default nil :height 130)))



(toggle-frame-maximized)

(load-theme 'atom-dark t)

(provide 'slipset-display)
