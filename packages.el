;;; packages.el --- prolog layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Newres Al Haider <newrescode@gmail.com>
;; URL: https://github.com/newres/spacemacs-prolog-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst prolog-packages
  '(
    (prolog :location built-in)
    (ediprolog)
    ))


(defun prolog/init-prolog ()
    (use-package prolog
      :defer t
      :init
      (progn
        ;;TODO: Setup here is based on the setup description for prolog.el of Stefan D. Bruda, but it seems to work for the emacs built-in version as well. Might be possible to trim this a bit down or alternatively expand the layer to encompass mappings for Mercury mode as well.
        (autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
        (autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
        (setq prolog-system 'swi)
        (setq auto-mode-alist (append '(("\\.pl$" . prolog-mode))
                                      auto-mode-alist))        )
      :config
      (progn
        (spacemacs/set-leader-keys-for-major-mode 'prolog-mode
          ;;Key Mappings
          ;;Consulting
          "sb" 'prolog-consult-buffer
          "sf" 'prolog-consult-file
          "sp" 'prolog-consult-predicate
          "sr" 'prolog-consult-region
          ;;Compiling
          "cb" 'prolog-compile-buffer
          "cf" 'prolog-compile-file
          "cp" 'prolog-compile-predicate
          "cr" 'prolog-compile-region
          ;;Dublicate keybinding to match expected convention.
          "cc" 'prolog-compile-file
          ;;Formatting
          "=" 'prolog-indent-buffer
          ;;Insert
          "im" 'prolog-insert-module-modeline
          "in" 'prolog-insert-next-clause
          "ip" 'prolog-insert-predicate-template
          "is" 'prolog-insert-predspec
          ;;Help
          "ha" 'prolog-help-apropos
          "hp" 'prolog-help-on-predicate
          )

        (dolist (prefix '(("ms" . "consulting")
                          ("mc" . "compiling")
                          ("mh" . "help")
                          ("mi" . "inserting")
                          ))
          (spacemacs/declare-prefix-for-mode 'prolog-mode (car prefix) (cdr prefix))))
      ))

(defun prolog/init-ediprolog ()
  (use-package ediprolog
    :defer t
    :config
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'prolog-mode
        ;;Key Mappings
        "ee" 'ediprolog-dwim)
      (spacemacs/declare-prefix-for-mode 'prolog-mode "me" "evaluating" ))))

;;; packages.el ends here
