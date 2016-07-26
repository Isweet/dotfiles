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

; Lean mode

(defvar lean-deps
  '(dash dash-functional f s company flycheck fill-column-indicator))

(dolist (dep lean-deps)
  (add-to-list 'package-list dep))

(setq lean-rootdir "/usr/local")
(add-to-list 'load-path (expand-file-name "usr/local/share/emacs/site-lisp/lean"))
(require 'lean-mode)

; Coq

(load-file "/usr/local/Cellar/proof-general/4.2/share/emacs/site-lisp/proof-general/generic/proof-site.el")
(add-hook 'proof-ready-for-assistant-hook (lambda () (show-paren-mode 0)))
(global-set-key (kbd "C-c C-h") 'proof-goto-point)

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
