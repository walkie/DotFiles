;; Loaded by "init.el".

(defun dotspacemacs/layers ()

  "Configuration layers declaration."

  (setq-default

    ;; Use the default distribution.
    dotspacemacs-distribution 'spacemacs

    ;; Lazily load unused layers, get confirmation before installing.
    dotspacemacs-enable-lazy-installation 'unused
    dotspacemacs-ask-for-lazy-installation t

    ;; Additional paths to look for configuration layers.
    ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
    dotspacemacs-configuration-layer-path '()

    ;; Configuration layers to load.
    dotspacemacs-configuration-layers
    '(
      helm
      ;; auto-completion
      better-defaults
      emacs-lisp
      ;; git
      markdown
      org
      ;; (shell :variables
      ;;        shell-default-height 30
      ;;        shell-default-position 'bottom)
      spell-checking
      syntax-checking
      ;; theming
      ;; themes-megapack
      ;; version-control
      )

   ;; Additional packages to install, not in a layer. These can be configured
   ;; in `dotspacemacs/user-config' (or consider wrapping in a layer).
   dotspacemacs-additional-packages '()

   ;; Packages that should not be updated.
   dotspacemacs-frozen-packages '()

   ;; Packages that should not be installed or loaded.
   dotspacemacs-excluded-packages '()

   ;; Uninstall packages if they're not being used.
   dotspacemacs-install-packages 'used-only)
  )
