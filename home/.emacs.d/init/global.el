;;;; Install and configure packages that affect all modes.

;; String manipulation library.
(use-package s)

;; Support hiding mode indicators.
(use-package delight)

;; Navigable editing history.
(use-package undo-tree :delight)

;; Enable vim bindings.
(use-package evil
  :init
    ;; (setq evil-emacs-state-cursor '("red" box))
    (setq evil-split-window-below t)
    (setq evil-vsplit-window-right t)
    (setq evil-want-C-u-scroll t) 
  :config
    (evil-mode 1))

;; Define keybindings that integrate nicely with evil.
(use-package general
  :config
    ;; Normal mode key bindings.
    (general-define-key
      :states 'normal
      ;; Make window switching easier.
      "H" 'evil-window-left
      "J" 'evil-window-down
      "K" 'evil-window-up
      "L" 'evil-window-right
      ;; Navigate by visual lines.
      "j" 'evil-next-visual-line
      "k" 'evil-previous-visual-line
      ;; Open buffer switcher.
      "B" 'buffer-menu)
    ;; Insert mode key bindings.
    (general-define-key
      :states 'insert
      ;; Continue comment on new line.
      "<S-return>" 'comment-indent-new-line)
    (general-define-key
      :states '(normal visual insert emacs)
      :prefix "SPC"
      :non-normal-prefix "C-SPC"
      "SPC" (general-simulate-key "M-x" :which-key "execute command (M-x)")))

;; Discoverable shortcuts.
(use-package which-key
  :config
    (which-key-mode)
  :delight)
