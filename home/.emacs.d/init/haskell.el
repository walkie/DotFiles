;;;; Install and configure Haskell packages.


;;; Helper functions

(defun walkie-haskell-open-above ()
  "Create a new line above the current one. Replaces evil-open-above
in haskell-mode do to annoying indentation bug."
  (interactive)
  (evil-previous-line)
  (evil-append-line nil)
  (haskell-indentation-newline-and-indent))

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


;; Load and configure haskell-mode and intero.

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
