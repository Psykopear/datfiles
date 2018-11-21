(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/lisp")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1f2022" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#4f97d7" "#a3a3a3"])
 '(ansi-term-color-vector
   [unspecified "#1f2022" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#4f97d7" "#a3a3a3"] t)
 '(column-number-mode t)
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (json-mode rjsx-mode js2-mode use-package-chords elpy neotree modalka ace-window company rg base16-theme helm use-package)))
 '(sclang-show-workspace-on-startup nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Emacs configuration first
(setq-default indent-tabs-mode nil) ;; No tabs
(setq make-backup-files nil) ;; No backup/save files
(scroll-bar-mode -1) ;; No scroll bar
(menu-bar-mode -1) ;; No menu bar
(setq create-lockfiles nil)
(setq auto-save-default nil)

;; Theme
(load-theme 'base16-materia t)
(setq base16-distinct-fringe-background nil)

;; Line number and fringe settings
(global-linum-mode 1)
(require 'linum-highlight-current-line-number)
(setq linum-format 'linum-highlight-current-line-number)
(setq-default left-fringe-width  10)
(setq-default right-fringe-width  0)
(setq git-gutter-fr:side 'left-fringe)

;; Movement
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)

;; Scrolling
(setq redisplay-dont-pause t
      scroll-margin 10
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;;; USE PACKAGE
(eval-when-compile (require 'use-package))

;; Theme
(use-package base16-theme :ensure t)

;; Helm
(use-package
  helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ([f10] . helm-buffers-list)
         ([f9] . helm-recentf)))

;; KeyChord
(use-package use-package-chords
  :ensure t
  :config (key-chord-mode 1))

;; Ripgrep
(use-package
  rg
  :ensure t
  :init (rg-enable-default-bindings (kbd "M-s")))

;; Evil
(use-package
  evil
  :ensure t
  :config
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (evil-mode))

(use-package
  evil-leader
  :ensure t
  :init (global-evil-leader-mode)
  :config (progn
            (evil-leader/set-leader ",")
            (evil-leader/set-key
              "w" 'save-buffer
              "c" 'kill-this-buffer
              "q" 'delete-window
              "g" 'evilnc-comment-or-uncomment-lines
              "m" 'toggle-truncate-lines
              "h" 'split-window-vertically
              "v" 'split-window-horizontally
              )))

;; Projectile
(use-package
  helm-projectile
  :ensure t
  :config 
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (helm-projectile-on)
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Company
(use-package company
  :ensure t
  :defer t
  :init (global-company-mode))

;; Tide
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (eldoc-mode +1)
  (evil-leader/set-key "d" 'tide-jump-to-definition)
  (company-mode +1)
  (tide-hl-identifier-mode +1))

(use-package tide
  :ensure t
  :config
  (progn
    (add-hook 'typescript-mode-hook #'setup-tide-mode)
    (add-hook 'rjsx-mode-hook #'setup-tide-mode)))

;; Json
(use-package json-mode
  :ensure t
  :defer t
  :mode "\\.json")

;; JSX
(use-package rjsx-mode
  :ensure t
  :defer 1
  :mode "\\.js$")

;; Ace
(use-package ace-window
  :ensure t
  :defer t
  )

(use-package neotree
  :ensure t
  :after (evil)
  :bind (("<f3>" . neotree-toggle))
  :defer
  :config
  (evil-set-initial-state 'neotree-mode 'normal)
  (setq neo-theme 'ascii)
  (add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
              (define-key evil-normal-state-local-map (kbd "r") 'neotree-rename-node)
              (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
              (define-key evil-normal-state-local-map (kbd "j") 'neotree-next-line)
              (define-key evil-normal-state-local-map (kbd "k") 'neotree-previous-line)
              (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
              (define-key evil-normal-state-local-map (kbd "C") 'neotree-change-root)
              (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide))))

(use-package elpy
  :ensure t
  :defer 2
  :config
  (progn
    ;; Use Flycheck instead of Flymake
    (when (require 'flycheck nil t)
      (remove-hook 'elpy-modules 'elpy-module-flymake)
      (remove-hook 'elpy-modules 'elpy-module-yasnippet)
      (remove-hook 'elpy-mode-hook 'elpy-module-highlight-indentation))
    (elpy-enable)
    ;; jedi is great
    (setq elpy-rpc-backend "jedi")))

(use-package prodigy
  :ensure t
  :defer t
  :config
  (add-hook 'prodigy-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "o") 'prodigy-display-process)
              (define-key evil-normal-state-local-map (kbd "m") 'prodigy-mark)
              (define-key evil-normal-state-local-map (kbd "s") 'prodigy-start)
              (define-key evil-normal-state-local-map (kbd "S") 'prodigy-stop)))
  (prodigy-define-service
    :name "Siqtraq services"
    :command "docker-compose"
    :cwd "/home/docler/workspace/siqtraq/"
    :args '("-f" "docker-services.yml" "up")
    :tags '(work siqtraq)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "Siqtraq runserver"
    :cwd "/home/docler/workspace/siqtraq/"
    :command "pipenv"
    :args '("run" "python" "siq/manage.py" "runserver")
    :tags '(work siqtraq)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "Siqtraq yarn watch"
    :cwd "/home/docler/workspace/siqtraq/frontend"
    :command "yarn"
    :args '("watch")
    :tags '(work siqtraq)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  )
