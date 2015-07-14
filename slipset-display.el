(set-frame-size (selected-frame) 162 80)
(split-window-horizontally)

(setq screen-width (x-display-pixel-width))
(setq screen-height (x-display-pixel-height))

(cond
 ((eq 1050 screen-height) (set-face-attribute 'default nil :height 100))
 ('t (set-face-attribute 'default nil :height 130)))

(set-face-attribute 'default nil :family "Consolas")
(set-face-attribute 'default nil :height 100)

(toggle-frame-maximized)

(provide 'slipset-display)
