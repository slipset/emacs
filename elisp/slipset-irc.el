(require 'rcirc)
(setq rcirc-omit-responses '("JOIN" "PART" "QUIT" "NICK" "AWAY"))

(add-to-list 'rcirc-server-alist
						 '("irc.freenode.net"
							 :channels ("#clojure")))

(setq rcirc-authinfo
      '(("freenode" nickserv "slipset" "5l1p53t")))

(provide 'slipset-irc)
