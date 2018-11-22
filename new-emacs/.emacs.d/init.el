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
   ["#263238" "#ec5f67" "#8bd649" "#ffcc00" "#89ddff" "#82aaff" "#89ddff" "#cdd3de"])
 '(ansi-term-color-vector
   [unspecified "#263238" "#ec5f67" "#8bd649" "#ffcc00" "#89ddff" "#82aaff" "#89ddff" "#cdd3de"] t)
 '(column-number-mode t)
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(neo-window-fixed-size nil)
 '(package-selected-packages
   (quote
    (evil-magit magit nav-flash markdown-mode yaml-mode groovy-mode dockerfile-mode evil-smartparens prettier-js diff-hl prodigy tide helm-projectile evil-leader evil json-mode rjsx-mode js2-mode use-package-chords elpy neotree modalka ace-window company rg base16-theme helm use-package)))
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

;; Movement
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "M-k") 'shrink-window)
(global-set-key (kbd "M-j") 'enlarge-window)
(global-set-key (kbd "M-h") 'shrink-window-horizontally)
(global-set-key (kbd "M-l") 'enlarge-window-horizontally)

;; Scrolling
(setq redisplay-dont-pause t
      scroll-margin 10
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; SCLang
(add-to-list 'load-path "/usr/share/SuperCollider/Extensions/scide_scel")
(require 'sclang)
;; in ~/.emacs.d/lisp/ directory
(require 'hl-line+)


;;; USE PACKAGE
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))

;; Magit
(use-package magit
  :ensure t
  :defer t
  :config (require 'evil-magit)
  :bind ("C-c g" . magit-status))

(use-package evil-magit
  :ensure t
  :after (magit evil)
  :defer t)

;; Theme
(use-package base16-theme :ensure t)

;; Nav-flash, for foxdot
(use-package nav-flash :ensure t)

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
  ;; Function that flashes current line and sends data to python shell
  (defun flash-send ()
    (interactive)
    (elpy-shell-send-statement)
    (flash-line-highlight))
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "C-<return>") 'flash-send)
  (define-key evil-normal-state-map (kbd "C-<return>") 'flash-send)
  (define-key evil-insert-state-map (kbd "C-<return>") 'flash-send)
  (evil-mode))

;; Function to open config file
(defun find-user-init-file ()
  "Edit the `user-init-file'."
  (interactive)
  (find-file user-init-file))

(use-package
  evil-leader
  :ensure t
  :init (global-evil-leader-mode)
  :config (progn
            (evil-leader/set-leader ",")
            (evil-leader/set-key
              "ev" 'find-user-init-file
              "a" 'rg-dwim
              "A" 'rg-literal
              "w" 'save-buffer
              "c" 'kill-this-buffer
              "q" 'delete-window
              "g" 'comment-line
              "t" 'elpy-test
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

;; Git related stuff
(use-package diff-hl
  :ensure t
  :init (global-diff-hl-mode t))

;; Smartparens
(use-package evil-smartparens
  :ensure t
  :defer t
  :init
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  :config
  (sp-local-pair '(emacs-lisp-mode) "'" "'" :actions nil)
  (sp-local-pair '(emacs-lisp-mode) "`" "`" :actions nil)
 )

;; Dockerfile
(use-package dockerfile-mode
  :ensure t
  :defer t)

;; Groovy / jenkinsfile
(use-package groovy-mode
  :ensure t
  :defer t)

;; Yaml
(use-package yaml-mode
  :ensure t
  :defer t)

;; Markdown
(use-package markdown-mode
  :ensure t
  :defer t)

;; Company
(use-package company
  :ensure t
  :defer t
  :init (global-company-mode))

;; Prettier JS
(use-package prettier-js
  :ensure t
  :defer t
  :config
  (add-hook 'rjsx-mode-hook 'prettier-js-mode))

;; Tide
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (eldoc-mode +1)
  (prettier-js-mode +1)
  (smartparens-mode +1)
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
  :defer t
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
  :defer t
  :commands elpy-enable
  :init (elpy-enable)
  :config
  (evil-leader/set-key "d" 'elpy-goto-definition)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--no-autoindent --no-color-info --no-banner --no-confirm-exit  --simple")
  (setq elpy-rpc-backend "jedi"))
  ;; (progn
    ;;  Flymake
    ;; (when (require 'flycheck nil t)
      ;; (remove-hook 'elpy-modules 'elpy-module-flymake)
      ;; (remove-hook 'elpy-modules 'elpy-module-yasnippet)
      ;; (remove-hook 'elpy-mode-hook 'elpy-module-highlight-indentation))
    ;; (setq elpy-rpc-backend "jedi")))

(use-package prodigy
  :ensure t
  :defer t
  :config
  (add-hook 'prodigy-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "f") 'prodigy-add-tag-filter)
              (define-key evil-normal-state-local-map (kbd "F") 'prodigy-clear-filters)
              (define-key evil-normal-state-local-map (kbd "J") 'prodigy-next-with-status)
              (define-key evil-normal-state-local-map (kbd "K") 'prodigy-prev-with-status)
              (define-key evil-normal-state-local-map (kbd "o") 'prodigy-display-process)
              (define-key evil-normal-state-local-map (kbd "m") 'prodigy-mark)
              (define-key evil-normal-state-local-map (kbd "s") 'prodigy-start)
              (define-key evil-normal-state-local-map (kbd "S") 'prodigy-stop)))
  (prodigy-define-service
    :name "Siqtraq services"
    :command "docker-compose"
    :cwd "/home/docler/workspace/siqtraq/"
    :args '("-f" "docker-services.yml" "up")
    :tags '(siqtraq run backend)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "Siqtraq runserver"
    :cwd "/home/docler/workspace/siqtraq/"
    :command "pipenv"
    :args '("run" "python" "siq/manage.py" "runserver")
    :tags '(siqtraq run backend)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "Siqtraq yarn watch"
    :cwd "/home/docler/workspace/siqtraq/frontend"
    :command "yarn"
    :args '("watch")
    :tags '(siqtraq run frontend)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "Siqtraq yarn tests"
    :cwd "/home/docler/workspace/siqtraq/frontend"
    :command "yarn"
    :args '("test")
    :tags '(siqtraq tests frontend)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "Siqtraq yarn tests UPDATE"
    :cwd "/home/docler/workspace/siqtraq/frontend"
    :command "yarn"
    :args '("test" "-u")
    :tags '(siqtraq tests frontend)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "Siqtraq tox"
    :cwd "/home/docler/workspace/siqtraq"
    :command "tox"
    :tags '(siqtraq tests backend)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "WFP-OEV yarn start"
    :cwd "/home/docler/workspace/wfp-oev"
    :command "yarn"
    :args '("start")
    :tags '(wfp-oev)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "WFP-OEV docker db"
    :cwd "/home/docler/workspace/wfp-oev"
    :command "docker"
    :args '("start" "-ai" "wfp-db")
    :tags '(wfp-oev)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  (prodigy-define-service
    :name "WFP-OEV runserver"
    :cwd "/home/docler/workspace/wfp-oev"
    :command "/home/docler/.virtualenvs/wfp-oev/bin/python"
    :args '("manage.py" "runserver")
    :tags '(wfp-oev)
    :stop-signal 'sigkill
    :kill-process-buffer-on-stop t)
  )
