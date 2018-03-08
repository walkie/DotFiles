;;;; Prerequisites

;; Turn on the built-in package manager, add package repos.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap the better package manager.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; String manipulation library.
(use-package s)

;; Support hiding mode indicators.
(use-package delight)

;; Navigable editing history.
(use-package undo-tree :delight)


;;;; Global behavior

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
      :states '(normal motion)
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
      "SPC" (general-simulate-key "M-x" :which-key "execute command (M-x)")
      "DEL" '(pop-global-mark :which-key "return from jump")))

;; Discoverable shortcuts.
(use-package which-key
  :config
    (which-key-mode)
  :delight)

;; Completion-based search framework.
(use-package ivy
  :init
    (setq ivy-count-format "")
    (setq ivy-use-virtual-buffers t)
  :config
    (ivy-mode 1)
  :delight)

;; Use ivy replacements for everything.
(use-package counsel
  :config
    (counsel-mode 1)
  :delight)


;;;; Applications

;; Add keybinding category for applications.
(general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "C-SPC"
  "a" '(:ignore t :which-key "applications"))

;; File browser.
(use-package ranger
  :config
    (ranger-override-dired-mode t)
    (general-define-key
      :states '(normal visual insert emacs)
      :prefix "SPC"
      :non-normal-prefix "C-SPC"
      "af" '(deer   :which-key "file browser (deer)")
      "aF" '(ranger :which-key "file browser (ranger)")))

;; Project navigation and management.
(use-package counsel-projectile
  :init
    ;; Get rid of the mode line.
    (setq projectile-mode-line nil) ; '(:eval (format " P[%s]" (projectile-project-name))))
    ;; Only grep the files I care about.
    (setq projectile-use-git-grep t)
  :config
    (counsel-projectile-mode)
    (general-define-key
      :states '(normal visual insert emacs)
      :prefix "SPC"
      :non-normal-prefix "C-SPC"
      "p"  '(:ignore t :which-key "project")
      "pB" '(projectile-compile-project   :which-key "build project")
      "pR" '(projectile-run-project       :which-key "run project")
      "pT" '(projectile-test-project      :which-key "run tests")
      "pf" '(counsel-projectile-find-file :which-key "find file")
      "pg" '(counsel-projectile-grep      :which-key "git grep")
      "pt" '(projectile-toggle-between-implementation-and-test :which-key "toggle impl/test")
      "pp" '(counsel-projectile-switch-project :which-key "switch project"))
  :delight)


;;;; Frameworks used by mode-specific packages

(defun walkie-only-whitespace-before-point ()
  "Is there only whitespace between the beginning of the line and the
current point."
  (interactive)
  (s-matches?
    "^\\s-*$"
    (buffer-substring-no-properties (line-beginning-position) (point))))

(defun walkie-tab-or-complete ()
  "Simulate a tab key press or trigger company completion, depending
on whether the point proceeds only whitespace or not."
  (interactive)
  (if (walkie-only-whitespace-before-point)
      (indent-for-tab-command)
    (company-complete-common)))

;; Completion at point framework.
(use-package company
  :init
    ;; Only pop-up when I ask for it.
    (setq company-idle-delay nil)
  :config
    (global-company-mode)
    ;; Configure "tab-n-go", tab and shift-tab to cycle candidates.
    (company-tng-configure-default)
    ;; Trigger auto-completion with tab.
    (general-define-key
      :states 'insert
      "TAB" 'walkie-tab-or-complete)
  :delight)

;; Reporting syntax and type errors in-context.
(use-package flycheck
  :config
    (general-define-key
      :keymaps 'flycheck-mode-map
      :states 'normal
      :prefix "SPC"
      "f" '(:ignore t :which-key "flycheck")
      "fe" '(flycheck-explain-error-at-point :which-key "explain error")
      "fn" '(flycheck-next-error             :which-key "next error")
      "fp" '(flycheck-previous-error         :which-key "previous error")))


;;;; Git Integration

(use-package magit)


;;;; Elisp

(defun walkie-open-init-file ()
  "Open my init file."
  (interactive)
  (find-file user-init-file))

(general-define-key
  :states 'normal
  :prefix "SPC"
  "e" '(:ignore t :which-key "emacs lisp")
  "ee" '(eval-last-sexp :which-key "eval last sexp")
  "ei" '(walkie-open-init-file :which-key "open init file")
  "e SPC" '(eval-expression :which-key "interactive eval"))


;;;; Org

;; Enable tab-cycling in any outline mode.
(general-define-key
  :keymaps 'outline-minor-mode-map
  :states 'normal
  "TAB" '(org-cycle :which-key "cycle visibility"))

(use-package org
  :init
    ;; Look for todo items in all files in this directory.
    (setq org-agenda-files '("~/Dropbox/Org"))
    ;; Make headings a bit less ugly.
    (setq org-fontify-whole-heading-line t)
    ;; Open files in the current buffer.
    (setq org-link-frame-setup '((file . find-file)))
    ;; Start with all sections expanded.
    (setq org-startup-folded nil)
    ;; Set up capture templates.
    (setq org-capture-templates
      '(("t" "New task" entry (file+headline "~/Dropbox/Org/Inbox.org" "Tasks")
         "* TODO %?\n")
        ("c" "New task with context" entry (file+headline "~/Dropbox/Org/Inbox.org" "Tasks")
         "* TODO %?\n%a\n")))
  :config
    (general-define-key
      :keymaps 'org-mode-map
      :states 'normal
      "<"   '(org-metaleft       :which-key "decrease heading")
      ">"   '(org-metaright      :which-key "increase heading")
      "t"   '(org-todo           :which-key "cycle todo state")
      "TAB" '(org-cycle          :which-key "cycle visibility")
      "RET" '(org-open-at-point  :which-key "open link")
      "DEL" '(org-mark-ring-goto :which-key "return from link"))
    (general-define-key
      :keymaps 'org-mode-map
      :states 'normal
      :prefix "SPC"
      "o"  '(:ignore t       :which-key "org")
      "oa" '(org-agenda      :which-key "open agenda")
      "ol" '(org-insert-link :which-key "edit/insert link")
      "or" '(org-refile      :which-key "refile entry")))


;;;; Haskell

(defun walkie-haskell-open-above ()
  "Create a new line above the current one. Replaces evil-open-above
in haskell-mode due to annoying indentation bug."
  (interactive)
  (if (= (line-number-at-pos) 1)
      (evil-open-above ())
    (evil-previous-line)
    (evil-append-line nil)
    (haskell-indentation-newline-and-indent)))

(defun walkie-haskell-open-below ()
  "Create a new line below the current one. Replaces evil-open-below
in haskell-mode do to annoying indentation bug."
  (interactive)
  (evil-append-line nil)
  (haskell-indentation-newline-and-indent))

(defun walkie-comment-auto-fill ()
  "Turn on auto-fill for comments only."
  (setq comment-auto-fill-only-comments t)
  (auto-fill-mode 1))

(use-package haskell-mode
  :config
    (general-define-key
      :keymaps 'haskell-mode-map
      :states 'normal
      "o" 'walkie-haskell-open-below
      "O" 'walkie-haskell-open-above)
    (add-hook 'haskell-mode-hook 'walkie-comment-auto-fill))

(use-package intero
  :config
    (intero-global-mode 1)
    (general-define-key
      :keymaps 'intero-mode-map
      :states 'normal
      :prefix "SPC"
      "h"  '(:ignore t                :which-key "haskell")
      "hd" '(intero-goto-definition   :which-key "jump to definition")
      "hi" '(intero-info              :which-key "info at cursor")
      "hl" '(intero-repl-load         :which-key "load file in REPL")
      ;; "hk" '(intero-repl-clear-buffer :which-key "clear REPL")
      "hr" '(intero-repl-restart      :which-key "restart REPL")
      "ht" '(intero-type-at           :which-key "type at cursor")))


;;;; Latex

;; (use-package tex-site)


;;;; Markdown (keybindings: TODO)

(use-package markdown-mode
  :mode
    (("README\\.md\\'" . gfm-mode)
     ("\\.md\\'" . markdown-mode)
     ("\\.markdown\\'" . markdown-mode))
  :init
    (setq markdown-command "pandoc")
  :config
    (general-define-key
      :keymaps 'markdown-mode-map
      :states 'normal
      :prefix "SPC"
      "m"  '(:ignore t :which-key "markdown")))


;;;; Theme

;; A nice light theme with good org-mode support.
(use-package leuven-theme
  :config
    (load-theme 'leuven t))


;;;; Settings

;; Use UTF-8 and unix line endings by default.
(prefer-coding-system 'utf-8-unix)

;; Automatically follow symlinks.
(setq vc-follow-symlinks t)

;; Better buffer name disambiguation.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Don't litter my file system with back-up files.
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backup"))))
(setq backup-by-copying t)

;; Disable "smart" indenting.
(setq-default electric-indent-inhibit t)

;; Only a single space to end sentences.
(setq sentence-end-double-space nil)

;; When auto-wrapping, wrap at 79 characters.
(setq-default fill-column 79)

;; Don't soft wrap long lines by default.
(setq-default truncate-lines t)

;; Don't show startup screen.
(setq inhibit-startup-screen t)

;; Show column number in mode line.
(setq column-number-mode t)

;; Highlight matching parens.
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Use a temp file for stuff generated by the GUI customizer.
(setq custom-file (make-temp-file "emacs-custom.el"))

;; Maximize window by default.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Disable tool bar and scroll bars.
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Turn off mouse highlighting.
;; (setq mouse-highlight nil)
