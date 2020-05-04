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
 '(package-selected-packages
   (quote
    (parinfer smex ergoemacs-mode fancy-narrow base16-theme smooth-scroll))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; My name and e-mail adress
(setq user-full-name   "%Balaram Usov%")
(setq user-mail-adress "%dest@disr.it%")

;;; Some preferences

;; global variables
(setq
 inhibit-startup-screen t
 ingibit-startup-message t
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

;; Electric-modes
(electric-pair-mode    1)
(electric-indent-mode -1)

;; Delete selection
(delete-selection-mode t)

;; Dired
(require 'dired)
(setq dired-recursive-deletes 'top)

;; Imenu
(require 'imenu)
(setq imenu-auto-rescan      t)
(setq imenu-use-popup-menu nil)
;(global-set-key (kbd "<f6>") 'imenu)

;; Display the name of the current buffer in the title bar
(setq frame-title-format "emacs: %b")

;; Org-mode settings
(require 'org)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cl" 'org-store-link)
(add-to-list 'auto-mode-alist '("\\.org$" . Org-mode))

;; Show-paren-mode settings
(show-paren-mode t)
(setq show-paren-style 'expression)

;; Disable GUI components
(tooltip-mode      -1)
(menu-bar-mode     -1)
(tool-bar-mode     -1)
(scroll-bar-mode   -1)
(blink-cursor-mode -1)
(setq use-dialog-box     nil)
(setq redisplay-dont-pause t)
(setq ring-bell-function 'ignore)

;; Coding-system settings
(set-language-environment 'UTF-8)
(progn
  (setq default-buffer-file-coding-system 'utf-8)
  (setq-default coding-system-for-read    'utf-8)
  (setq file-name-coding-system           'utf-8)
  (set-selection-coding-system            'utf-8)
  (set-keyboard-coding-system        'utf-8-unix)
  (set-terminal-coding-system             'utf-8)
  (prefer-coding-system                   'utf-8))

;; Font
(add-to-list 'default-frame-alist '(font . "Hack-14" ))
(set-face-attribute 'default t :font "Hack-14" )

;; Linum plugin
(require 'linum)
(line-number-mode   t)
(global-linum-mode  t)
(column-number-mode t)
(setq linum-format " %d")

;; Fringe settings
(fringe-mode '(8 . 0)) ;; органичиталь текста только слева
(setq-default indicate-empty-lines t) ;; отсутствие строки выделить глифами рядом с полосой с номером строки
(setq-default indicate-buffer-boundaries 'left) ;; индикация только слева

;; Display file size/time in mode-line
(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode          t) ;; размер файла в %-ах

;; Line wrapping
(setq word-wrap          t) ;; переносить по словам
(global-visual-line-mode t)

;; IDO plugin
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

;; Buffer Selection and ibuffer settings
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer) ;; отдельный список буферов при нажатии C-x C-b
(global-set-key (kbd "<f2>") 'bs-show) ;; запуск buffer selection кнопкой F2

;; Easy transition between buffers: M-arrow-keys
(if (equal nil (equal major-mode 'org-mode))
  (windmove-default-keybindings 'meta))

;; Highlight search resaults
(setq search-highlight        t)
(setq query-replace-highlight t)

;; Bookmark settings
(require 'bookmark)
(setq bookmark-save-flag t) ;; автоматически сохранять закладки в файл
(when (file-exists-p (concat user-emacs-directory "bookmarks"))
    (bookmark-load bookmark-default-file t)) ;; попытаться найти и открыть файл с закладками
(global-set-key (kbd "<f3>") 'bookmark-set) ;; создать закладку по F3 
(global-set-key (kbd "<f4>") 'bookmark-jump) ;; прыгнуть на закладку по F4
(global-set-key (kbd "<f5>") 'bookmark-bmenu-list) ;; открыть список закладок
(setq bookmark-default-file (concat user-emacs-directory "bookmarks")) ;; хранить закладки в файл bookmarks в .emacs.d

;;; Keyboard features

;; meta
;; (setq x-hyper-keysym 'meta)

;; ergoemacs
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)

;; M-x
(smex-initialize)


;;; Extensions

(setq extension-path "~/.emacs.d/scripts/")
(add-to-list 'load-path extension-path)

;; Theme
(load-theme 'base16-atelier-forest t)

;; Smooth scrolling
(require 'smooth-scroll)
(smooth-scroll-mode t)


;; (defcustom smooth-scroll/
(global-set-key [(control  down)]  'scroll-up-1)
(global-set-key [(control  up)]    'scroll-down-1)
(global-set-key [(control  left)]  'scroll-right-1)
(global-set-key [(control  right)] 'scroll-left-1)


;; Lisp

;;; parinfer

(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
             pretty-parens  ; different paren styles for different modes.
             evil           ; If you use Evil.
             lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
             paredit        ; Introduce some paredit commands.
             smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
             smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))

(setq parinfer-auto-switch-indent-mode t)

