;;;; Install and configure org-mode.

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
      "ol" '(org-insert-link :which-key "edit/insert link")))
