;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Qing Yin"
      user-mail-address "qingbyin@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; If we want to use shuang pin,
;; run `sudo apt-get insatll librime-data-double-pinyin` first
;; and add `double_pinyin_flypy` into schema see https://www.v2ex.com/t/232790
(use-package! rime
              :custom
              (default-input-method "rime")
              (rime-show-candidate 'posframe)
              ; (rime-user-data-dir "~/.config/fcitx/rime")
              )

(use-package! sis
              :config
              ;; Use rime
              (sis-ism-lazyman-config nil "rime" 'native)
            ;;   (sis-ism-lazyman-config nil "pyim" 'native)
              ; Enable the /cursor color/ mode
              (sis-global-cursor-color-mode)
              ; Enable the /respect/ mode
              (sis-global-respect-mode t)
              ; Enable the /follow context/ mode for all buffers
              (sis-global-follow-context-mode t)
              ; Enable the /inline english/ mode for all buffers
              (sis-global-inline-mode t)
              )

;; * set browser in wsl
;; Need to install chromium-browser and Xserver first
;; (setq browse-url-browser-function 'browse-url-generic
;;       browse-url-generic-program "chromium-browser")
;; Use Windows Chrome: need
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "wsl-open")

;; * open pdf/docx files using xdg-open (wsl-oepn in WSL)
;; from https://emacs.stackexchange.com/a/42139/30372
(defun xdg-open (filename)
  (interactive "fFilename: ")
  (let ((process-connection-type))
    (start-process "" nil "wsl-open" (expand-file-name filename))))

(defun find-file-auto (orig-fun &rest args)
  (let ((filename (car args)))
    (if (cl-find-if
         (lambda (regexp) (string-match regexp filename))
         '("\\.pdf\\'" "\\.docx?\\'"))
        (xdg-open filename)
      (apply orig-fun args))))

(advice-add 'find-file :around 'find-file-auto)

;; Markdown
(use-package! livedown)

;; Zotero
(use-package! zotxt)
;; Use better bibtex key to insert references
(setq org-zotxt-link-description-style ':betterbibtexkey)