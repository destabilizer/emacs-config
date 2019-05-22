;;; Packages

(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/"))
 package-archive-priorities '(("melpa" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


;;; Auto
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selectionchktex-program (quote zathura) t)
 '(android-mode-sdk-dir "/opt/android-sdk/")
 '(package-selected-packages
   (quote
    (ergoemacs-mode tidal arduino-mode android-mode auctex fancy-narrow base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; Some preferences

;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)


;;; Extensions

(setq extension-path "~/.emacs.d/scripts/")
(add-to-list 'load-path extension-path)

;; Theme

(load-theme 'base16-atelier-forest t)

;; Font

(add-to-list 'default-frame-alist '(font . "Hack-11" ))
(set-face-attribute 'default t :font "Hack-11" )

;; Smooth scrolling
(require 'smooth-scroll)
(smooth-scroll-mode t)

;; ergoemacs
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)


;; (defcustom smooth-scroll/

(global-set-key [(control  down)]  'scroll-up-1)
(global-set-key [(control  up)]    'scroll-down-1)
(global-set-key [(control  left)]  'scroll-right-1)
(global-set-key [(control  right)] 'scroll-left-1)

;; Sublimity

(add-to-list 'load-path (concat extension-path "sublimity/"))

(require 'sublimity)
;(require 'sublimity-scroll)
;(require 'sublimity-map) ;; experimental
;(require 'sublimity-attractive)

;; 

(sublimity-mode 1)

;; Android Mode

; (require 'android-mode)

;; SuperCollider
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/SuperCollider/")
(require 'sclang)
