;; Setup package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; If use-package doesn't exist, make it exist
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Install packages

;;; Monokai Theme
(use-package monokai-theme)

;;; Haskell
(use-package haskell-mode)

;; UI
(load-theme 'monokai t)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Sensible defaults

;;; No tabs
(setq-default indent-tabs-mode nil)

;;; 2 spaces instead
(setq-default tab-width 2)

;;; I want line numbers, and current line highlighted
(setq-default linum-format " %d ")
(global-linum-mode t)
(global-hl-line-mode 1)
(set-face-background 'hl-line "#262626")
(set-face-foreground 'highlight nil)

;;; No annoying files, no automatically saving
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)

;;; When I open a symlink, open the file pointed to
(setq-default vc-follow-symlinks t)

;;; Smoother scrolling?
(setq scroll-conservatively 101)

;;; Show column number in status bar
(setq column-number-mode t)

;;; Highlight matching parens
(show-paren-mode 1)

;; When in Haskell, TeX input
;; (add-hook 'haskell-mode-hook (lambda () (set-input-method "TeX")))
