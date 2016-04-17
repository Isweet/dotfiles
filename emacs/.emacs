;; Packages
(require 'package)

(setq package-list '(monokai-theme evil))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

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

(setq linum-format "%d ")
(global-linum-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)
