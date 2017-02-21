(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Packages
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

(setq package-list '())

; Monokai color scheme

(add-to-list 'package-list 'monokai-theme)

; Vim

(add-to-list 'package-list 'evil)

; Haskell mode

(add-to-list 'package-list 'haskell-mode)

; OCaml mode

(add-to-list 'package-list 'tuareg)

; Coq

(load-file "/usr/local/Cellar/proof-general/4.4/share/emacs/site-lisp/proof-general/generic/proof-site.el")
(add-hook 'proof-ready-for-assistant-hook (lambda () (show-paren-mode 0)))
(add-hook 'coq-mode-hook (lambda () (local-set-key (kbd "C-c RET") 'proof-goto-point)))

;; Install
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; UI
(load-theme 'monokai t)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Default Packages

; Evil
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode t)

;; Sensible defaults
(setq-default indent-tabs-mode nil)
(setq-default c-basic-indent 2)
(setq tab-width 2)

(setq linum-format " %d ")
(global-linum-mode t)
(global-hl-line-mode 1)
(set-face-background 'hl-line "#262626")
(set-face-foreground 'highlight nil)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq vc-follow-symlinks t)

(setq scroll-conservatively 101)

(setq column-number-mode t)
(show-paren-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (monokai-theme evil haskell-mode tuareg))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
