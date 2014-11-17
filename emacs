; set up load path
(add-to-list 'load-path "/Users/walkie/.emacs.d")


;;;; Plugins - load these first so we can override their settings later

; turn on and configure undo-tree plugin
(add-to-list 'load-path "/Users/walkie/.emacs.d/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode)

; vim bindings
(add-to-list 'load-path "/Users/walkie/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(setq evil-want-C-u-scroll t)
(setq evil-emacs-state-cursor '("red" box))

; escape always quits, like vim
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

; turn on proof general
(load-file "/Users/walkie/.emacs.d/proofgeneral/generic/proof-site.el")

; enable idris mode
(add-to-list 'load-path "/Users/walkie/.emacs.d/idris-mode")
(require 'idris-mode)

; set up agda-mode
; (load-file (let ((coding-system-for-read 'utf-8))
;                 (shell-command-to-string "agda-mode locate")))


;;;; Settings

; set up color theme
; (require 'color-theme)
; (color-theme-initialize)
; (color-theme-hober)

; set font
(set-default-font "DejaVu_Sans_Mono")

; turn off mouse highlighting--hate it!
(setq mouse-highlight nil)

; disable toolbar
(tool-bar-mode 0)
