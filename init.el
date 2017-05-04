(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)
(custom-set-variables)

; start package.el with emacs
(require 'package)

; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

; initialize package.el
(package-initialize)

; start auto-complete with emacs
(require 'auto-complete)

; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

; initialize auto-complete-c-headers
(defun my:acc-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c++mode-hook 'my:acc-c-header-init)
(add-hook 'c-mode-hook 'my:acc-c-header-init)

; iedit mode
(define-key global-map (kbd "C-c ;") 'iedit-mode)

; turn on Semantic
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

; turn on ede mode-name
(global-ede-mode 1)
; turn on automatic raprsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)
