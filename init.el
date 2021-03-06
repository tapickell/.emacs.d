
(set-face-attribute 'default nil :height 100)

(setq-default major-mode 'text-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)

;;*************************************************************

(require 'package)

(add-to-list 'load-path "~/.emacs.d/elpa")

;;(add-to-list 'load-path "~/emacs.d/emmet-mode")
;;(require 'emmet-mode)

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
  '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
  '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)

;;*************************************************************

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa//ac-dict")
(ac-config-default)
(setq ac-use-quick-help t)

;;*************************************************************

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation

;;*************************************************************

(setq cider-show-error-buffer nil)
(setq nrepl-buffer-name-show-port t)
(setq cider-repl-display-in-current-window t) ;;C-c C-z show cider repl in current window
(setq cider-repl-result-prefix ";; => ")
;; Not working! (setq cider-known-endpoints '(("groops" "127.0.0.1" "8030")))
(setq-default tab-width 2) ;; Tab width of 2
(fset 'yes-or-no-p 'y-or-n-p) ;; Accept y or n instead of whole word

;; Interactive Do mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Clojure Auto-files
(setq auto-mode-alist (cons '("\\.edn$" . clojure-mode) auto-mode-alist)) ;; *.edn are Clojure files
(setq auto-mode-alist (cons '("\\.cljs$" . clojure-mode) auto-mode-alist)) ;; *.cljs are Clojure files

;; Smex Ido on M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;*************************************************************

(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(global-set-key (kbd "M-p") 'package-list-packages)


;;*************************************************************

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	 ["#000000" "#d01A4E" "#7E7D7E" "#b58900" "#268bd2" "#d33682" "#2aa198" "#DCDCCC"])
 '(custom-safe-themes
	 (quote
		("4af6fad34321a1ce23d8ab3486c662de122e8c6c1de97baed3aa4c10fe55e060" "1c50040ec3b3480b1fec3a0e912cac1eb011c27dd16d087d61e72054685de345" default)))
 '(fci-rule-color "#383838")
 '(org-modules
	 (quote
		(org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-drill)))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
	 (quote
		((20 . "#dc322f")
		 (40 . "#d01A4E")
		 (60 . "#cb4b16")
		 (80 . "#b58900")
		 (100 . "#b58900")
		 (120 . "#b58900")
		 (140 . "#7E7D7E")
		 (160 . "#7E7D7E")
		 (180 . "#9FAA9B")
		 (200 . "#9FC59F")
		 (220 . "#859900")
		 (240 . "#31be67")
		 (260 . "#2aa198")
		 (280 . "#268bd2")
		 (300 . "#268bd2")
		 (320 . "#268bd2")
		 (340 . "#00a74e")
		 (360 . "#d33682"))))
 '(vc-annotate-very-old-color "#d33682"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'evil)
(evil-mode 1)

(global-relative-line-numbers-mode)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Transparent Emacs
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(88 70))
    (add-to-list 'default-frame-alist '(alpha 88 70))

;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
'(auto-dim-other-buffers-face ((t (:background "color-235"))))


(setq multi-term-program "/bin/zsh")
