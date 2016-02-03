;; (setq exec-path (append exec-path '("/opt/boxen/homebrew/bin")))
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emms/lisp")
;; (require 'emms-setup)
;; (require 'emms-player-mplayer)
;; (emms-standard)
;; (emms-default-players)
;; (define-emms-simple-player mplayer '(file url)
;;       (regexp-opt '(".ogg" ".mp3" ".wav" ".mpg" ".mpeg" ".wmv" ".wma"
;;                     ".mov" ".avi" ".divx" ".ogm" ".asf" ".mkv" "http://" "mms://"
;;                     ".rm" ".rmvb" ".mp4" ".flac" ".vob" ".m4a" ".flv" ".ogv" ".pls"))
;;       "mplayer" "-slave" "-quiet" "-really-quiet" "-fullscreen")


(require 'emms-setup)
(emms-standard)
(emms-all)
(emms-default-players)
(setq emms-player-vlc-command-name
      "/Applications/VLC.app/Contents/MacOS/VLC")
(require 'emms-player-vlc)
(define-emms-simple-player vlc '(file url)
  (concat "\\`\\(https?\\|mms\\)://\\|"
      (emms-player-simple-regexp
       "ogg" "mp3" "wav" "mpg" "mpeg" "wmv" "wma"
       "mov" "avi" "divx" "ogm" "ogv" "asf" "mkv"
       "rm" "rmvb" "mp4" "flac" "vob" "m4a" "ape"))
  "vlc" "--intf=rc")
