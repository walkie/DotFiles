;;;; Package for reporting syntax and type errors in-context.

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
