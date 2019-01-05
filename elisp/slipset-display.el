

(defun display-type ()
  (interactive)
  (cond ((and (= 2560 (display-pixel-width))
	      (= 1440 (display-pixel-height)))
	 '4k)
	((and (= 3200 (display-pixel-width))
	      (= 1800 (display-pixel-height)))
	 '4k)
	((and (= 1680 (display-pixel-width))
	      (= 1050 (display-pixel-height)))
	 'mbp-13)
	((and t ;(= 3440 (display-pixel-width))
	      (= 1480 (display-pixel-height)))
	 '4k-wide)))

(defun do-font-scaling (display-type)
  (interactive)
  (cond ((eq display-type 'mbp-13)
	 (set-face-attribute 'default nil :height 100))
	((eq display-type '4k)
	 (set-face-attribute 'default nil :height 110))
	((eq display-type '4k-wide)
	 (set-face-attribute 'default nil :height 100))))

(setq slipset-display (display-type))

(when (window-system)
  (set-frame-font slipset-font-family))

(defun reset-display ()
  (interactive)
  (do-font-scaling (display-type)))

(reset-display)

(toggle-frame-fullscreen)
(load-theme 'atom-dark t)

(defun 4k-wide ()
  (interactive)
  (purpose-load-frame-layout "4k-wide"))

(defun laptop ()
  (interactive)
  (purpose-load-frame-layout "laptop"))

(provide 'slipset-display)



