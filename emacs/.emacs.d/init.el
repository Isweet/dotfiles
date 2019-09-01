 ;; Ian's Emacs Config
(setq inhibit-startup-screen t)

;;; Package Setup
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq package-list '())

;;; Unicode

; (add-to-list 'load-path "~/.emacs.d/lib")
; (load-library "unicode")
; (set-input-method "darais")

;;; Packages

(use-package monokai-theme
  :ensure t)

(use-package company
  :ensure t)
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map [tab] 'company-complete-common-or-cycle)))
(setq company-idle-delay 0)


(use-package flycheck
  :ensure t)

;;;; Go
(use-package go-mode
  :ensure t)
(use-package company-go
  :ensure t)
(add-hook 'go-mode-hook (lambda ()
			  (set (make-local-variable 'company-backends) '(company-go))
                          (flycheck-mode)
			  (company-mode)))
(add-hook 'before-save-hook 'gofmt-before-save)


(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;;; UI

(load-theme 'monokai t)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Sensible defaults
(setq-default indent-tabs-mode nil)
(setq-default c-basic-indent 2)
(setq tab-width 2)

; Remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq linum-format " %d ")
(global-linum-mode t)
(global-hl-line-mode 1)
(set-face-background 'hl-line "#262626")
(set-face-foreground 'highlight nil)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq save-abbrevs nil)

(setq vc-follow-symlinks t)

(setq scroll-conservatively 101)

(setq column-number-mode t)
(show-paren-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (go-mode use-package monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
