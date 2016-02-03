(setq starttls-use-gnutls t
      starttls-gnutls-program "/opt/boxen/homebrew/Cellar/gnutls/3.3.15/bin/gnutls-cli"
      starttls-extra-arguments nil)

(require 'jabber)
(setq jabber-chat-buffer-show-avatar nil)
(setq jabber-account-list '
      (
       ("villa@dvillanueva.com"
        (:network-server . "talk.google.com")
        (:port . 443)
        (:connection-type . ssl))
       ("villanopack@chat.facebook.com"
        (:network-server . "chat.facebook.com")
        (:port . 5222)
        (:connection-type . starttls))
       ("david.villanueva@wuaki.tv"
        (:network-server . "talk.google.com")
        (:port . 443)
        (:connection-type . ssl))
       ("20667_436839@chat.hipchat.com"
        (:network-server . "conf.hipchat.com")
        (:port . 5223)
        (:connection-type . ssl))
       ))
