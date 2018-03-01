;;;; Set up the company auto-completion framework.


;;; Helper functions

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


;;; Install package

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
