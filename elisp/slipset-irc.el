(require 'rcirc)
(setq rcirc-omit-responses '("JOIN" "PART" "QUIT" "NICK" "AWAY"))

(setq rcirc-default-full-name "Erik Assum")
(setq rcirc-default-nick "slipset")

(add-to-list 'rcirc-server-alist
						 '("irc.freenode.net"
							 :channels ("#clojure")))

(setq rcirc-authinfo
      '(("freenode" nickserv "slipset" "5l1p53t")))

(provide 'slipset-irc)
