
(setq slipset-display (cond ((and (= 2560 (display-pixel-width))
				  (= 1440 (display-pixel-height)))
			     '4k)
			    ((and (= 3440 (display-pixel-width))
				  (= 1440 (display-pixel-height)))
			     '4k-wide)
			    ((and (= 1920 (display-pixel-width))
				  (= 1200 (display-pixel-height)))
			     'laptop)))

(when (window-system)
  (set-default-font slipset-font-family))

(cond ((eq slipset-display '4k)
       (set-face-attribute 'default nil :height 110))
      ((eq slipset-display '4k-wide)
       (set-face-attribute 'default nil :height 100)))

(toggle-frame-fullscreen)
(load-theme 'atom-dark t)

(provide 'slipset-display)
