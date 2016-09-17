; -*- mode: Lisp; -*-

(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file 'noerror)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(set-default-font "-*-DejaVu Sans Mono-*-*-*-*-*-160-*-*-*-*-iso10646-1")

(load "~/.emacs.d/lisp/org-config")
(load "~/.emacs.d/lisp/pkg")
(load "~/.emacs.d/lisp/tex-config")
(load "~/.emacs.d/lisp/yasnippet")
(load "~/.emacs.d/lisp/keybindings")
(load "~/.emacs.d/lisp/printing")
;(load "~/.emacs.d/lisp/mc") ; multi-cursor
;(load "~/.emacs.d/lisp/info")
;(load "~/.emacs.d/lisp/smart-tab/smart-tab")
;(load "~/.emacs.d/lisp/emms")
;(load "~/.emacs.d/lisp/maxima")
;(load "~/.emacs.d/lisp/erc")

(autoload 'nasm-mode "~/.emacs.d/lisp/nasm-mode.el" "" t)
(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\|nas\\)$" . nasm-mode))

(autoload 'gtags-mode "gtags" "" t)
(setq gtags-suggested-key-mapping t)

(add-hook 'c-mode-hook '(lambda () (gtags-mode 1)))
(add-hook 'c-mode-hook '(lambda () (local-set-key (kbd "M->") 'gtags-find-rtag)))
(add-hook 'asm-mode-hook '(lambda () (gtags-mode 1)))
(add-hook 'asm-mode-hook '(lambda () (local-set-key (kbd "M->") 'gtags-find-rtag)))
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;; flyspell
;;; modes for programming languages; check spelling only in comments/strings
(add-hook          'c-mode-hook 'flyspell-prog-mode)
(add-hook         'sh-mode-hook 'flyspell-prog-mode)
(add-hook        'c++-mode-hook 'flyspell-prog-mode)
(add-hook       'ruby-mode-hook 'flyspell-prog-mode)
(add-hook      'cperl-mode-hook 'flyspell-prog-mode)
(add-hook      'LaTeX-mode-hook 'flyspell-prog-mode)
(add-hook     'python-mode-hook 'flyspell-prog-mode)
(add-hook   'autoconf-mode-hook 'flyspell-prog-mode)
(add-hook   'autotest-mode-hook 'flyspell-prog-mode)
(add-hook   'makefile-mode-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook        'org-mode-hook (lambda () (flyspell-mode 1)))
(add-hook       'text-mode-hook (lambda () (flyspell-mode 1)))
(add-hook 'change-log-mode-hook (lambda () (flyspell-mode 1)))
(add-hook    'texinfo-mode-hook (lambda () (setq flyspell-generic-check-word-p 'texinfo-mode-flyspell-verify)))

(put    'upcase-region 'disabled nil)
(put  'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq
 dictionary-server "localhost"
 debug-on-error t
 x-select-enable-clipboard t
 default-major-mode 'text-mode
 browse-url-generic-program (executable-find "google-chrome")
 browse-url-browser-function 'browse-url-generic
 global-auto-revert-mode t
 flyspell-issue-message-flag nil
 ispell-program-name (executable-find "aspell")
 ispell-extra-args '("--reverse")
 cua-selection-mode t
 cua-auto-tabify-rectangles nil
 ido-auto-merge-delay-time 2
 )

(electric-pair-mode 1)

(ido-mode t)

(put 'dired-find-alternate-file 'disabled nil)

;themes
; http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq
 custom-theme-directory "~/.emacs.d/themes/"
 custom-enabled-themes '(zenburn)
 )

(load-theme 'zenburn t)
