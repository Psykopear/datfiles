;; Set garbage collector threshold to a high value during startup
;; set it back to its default value at the end of the init script
(setq gc-cons-threshold 100000000)

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
 '(magit-diff-refine-hunk (quote all))
 '(neo-vc-integration (quote (face)))
 '(neo-window-fixed-size nil)
 '(package-selected-packages
   (quote
    (forge qml-mode docker buffer-move tabbar realgud mocha indium flycheck-rust racer rust-mode esup multiple-cursors blacken hide-mode-line doom-modeline evil-magit magit nav-flash markdown-mode yaml-mode groovy-mode dockerfile-mode evil-smartparens prettier-js diff-hl prodigy tide helm-projectile evil-leader evil json-mode rjsx-mode js2-mode use-package-chords elpy neotree modalka ace-window company rg base16-theme helm use-package)))
 '(realgud-safe-mode nil)
 '(sclang-show-workspace-on-startup nil)
 '(show-paren-mode t)
 '(tabbar-background-color "gray19")
 '(tabbar-mode t nil (tabbar))
 '(tabbar-mwheel-mode t nil (tabbar))
 '(tabbar-separator (quote ("-")))
 '(tabbar-use-images nil)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number-current-line ((t (:background "dark orange" :foreground "#2C393F" :inverse-video t))))
 '(tabbar-button ((t nil)))
 '(tabbar-button-highlight ((t nil)))
 '(tabbar-default ((t (:inherit variable-pitch :foreground "dim gray" :height 0.8))))
 '(tabbar-selected ((t (:foreground "dark orange"))))
 '(tabbar-selected-modified ((t (:foreground "red"))))
 '(tabbar-unselected ((t nil))))

(require 'bind-key)
(require 'use-package)
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

(global-display-line-numbers-mode 1)
(setq-default left-fringe-width  10)
(setq-default right-fringe-width  0)

(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

;; Movement
(global-set-key (kbd "C-s") 'ace-swap-window)
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
(require 'use-package)

;; Tabbar
(use-package tabbar
  :ensure t
  :defer t)

;; Theme
(use-package base16-theme
  :ensure t
  :defer t)

;; Buffer move
(use-package buffer-move
  :ensure t
  :defer t
  :config
  (global-set-key (kbd "C-S-k") 'buf-move-up)
  (global-set-key (kbd "C-S-j") 'buf-move-down)
  (global-set-key (kbd "C-S-h") 'buf-move-left)
  (global-set-key (kbd "C-S-l") 'buf-move-right)
  )


;; DOOM Modeline
(use-package doom-modeline
  :ensure t
  :defer t
  :config
  (setq doom-modeline-icon t)
  (setq doom-modeline-major-mode-icon t)
  :hook (after-init . doom-modeline-init))

;; Multiple cursors
(use-package multiple-cursors
  :ensure t
  :defer t
  :init
  (progn
    ;; these need to be defined here - if they're lazily
    ;; loaded with :bind they don't work.
    (global-set-key (kbd "C-<") 'mc/mark-next-like-this)
    (global-set-key (kbd "C->") 'mc/mark-previous-like-this)))

;; Magit
(use-package magit
  :ensure t
  :defer t
  :config
  (require 'evil-magit)
  ;; (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
  :bind ("C-c g" . magit-status))

(use-package forge
  :after magit
  :ensure t)

;; (use-package magithub
;;   :after magit
;;   :ensure t
;;   :config
;;   (magithub-feature-autoinject t)
;;   (setq magithub-clone-default-directory "~/repos"))

;; (use-package magit-gh-pulls
;;   :ensure t
;;   :defer t
;;   :after (magit))

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
  (add-to-list 'evil-insert-state-modes 'indium-repl-mode)
  ;; Function that flashes current line and sends data to python shell
  (defun flash-send ()
    (interactive)
    (elpy-shell-send-statement)
    (flash-line-highlight))
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (define-key evil-visual-state-map (kbd "C-<return>") 'flash-send)
  (define-key evil-normal-state-map (kbd "C-<return>") 'flash-send)
  (define-key evil-insert-state-map (kbd "C-<return>") 'flash-send)
  (define-key evil-normal-state-map (kbd "TAB") 'tabbar-forward-tab)
  (define-key evil-normal-state-map (kbd "<backtab>") 'tabbar-backward-tab)
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
  (sp-local-pair '(emacs-lisp-mode) "`" "`" :actions nil))

;; LANGUAGES

;; qml
(use-package qml-mode
  :ensure t
  :defer t)

;; Dockerfile
(use-package dockerfile-mode
  :ensure t
  :defer t)

;; Docker control
(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

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
  ;; Treat '_' as part of the word
  (add-hook 'rjsx-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (evil-leader/set-key-for-mode 'rjsx-mode "t" 'mocha-test-at-point)
  (evil-leader/set-key-for-mode 'rjsx-mode "d" 'tide-jump-to-definition)
  (evil-leader/set-key-for-mode 'rjsx-mode "D" 'tide-jump-back)
  (company-mode +1)
  (tide-hl-identifier-mode +1))

(use-package tide
  :ensure t
  :config
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  (add-hook 'rjsx-mode-hook #'setup-tide-mode))

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

;; Indium
(use-package indium
  :ensure t
  :defer t)
(use-package realgud
  :ensure t
  :defer t)



;; JS DEBUG
(use-package mocha
  :ensure t
  :commands (mocha-test-project
             mocha-debug-project
             mocha-test-file
             mocha-debug-file
             mocha-test-at-point
             mocha-debug-at-point)
  :config
  ;; Clear up stray ansi escape sequences.
  (defvar jj*--mocha-ansi-escape-sequences
    ;; https://emacs.stackexchange.com/questions/18457/stripping-stray-ansi-escape-sequences-from-eshell
    (rx (or
         "^[\\[[0-9]+[a-z]"
         "�[1A"
         "�[999D")))

  (defun jj*--mocha-compilation-filter ()
    "Filter function for compilation output."
    (ansi-color-apply-on-region compilation-filter-start (point-max))
    (save-excursion
      (goto-char compilation-filter-start)
      (while (re-search-forward jj*--mocha-ansi-escape-sequences nil t)
        (replace-match ""))))
  (advice-add 'mocha-compilation-filter :override 'jj*--mocha-compilation-filter)
  ;; https://github.com/scottaj/mocha.el/issues/3
  (defcustom mocha-jest-command "node_modules/jest/bin/jest.js --colors"
    "The path to the jest command to run."
    :type 'string
    :group 'mocha)
  (defun mocha-generate-command--jest-command (debug &optional filename testname)
    "Generate a command to run the test suite with jest.
If DEBUG is true, then make this a debug command.
If FILENAME is specified run just that file otherwise run
MOCHA-PROJECT-TEST-DIRECTORY.
IF TESTNAME is specified run jest with a pattern for just that test."
    (let ((target (if testname (concat " --testNamePattern \"" testname "\"") ""))
          (path (if (or filename mocha-project-test-directory)
                    (concat " --testPathPattern \""
                            (if filename filename mocha-project-test-directory)
                            "\"")
                  ""))
          (node-command
           (concat mocha-which-node
                   (if debug (concat " --inspect=" mocha-debug-port) ""))))
      (concat node-command " "
              mocha-jest-command
              target
              path)))

  (advice-add 'mocha-generate-command
              :override 'mocha-generate-command--jest-command))

;; Ace
(use-package ace-window
  :ensure t
  :defer t
  )

;; Neotree
(use-package hide-mode-line
  :ensure t
  :after (neotree)
  :config
  (add-hook 'neotree-mode-hook #'hide-mode-line-mode))

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
              (display-line-numbers-mode 0)
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

;; Python
(use-package elpy
  :ensure t
  :defer t
  :commands elpy-enable
  :init (elpy-enable)
  :config
  ;; Autoload virtualenv if a .venv file is found
  (defun pyvenv-autoload ()
    (require 'projectile)
    (let* ((pdir (projectile-project-root)) (pfile (concat pdir ".venv")))
      (if (file-exists-p pfile)
          (pyvenv-workon (with-temp-buffer
                           (insert-file-contents pfile)
                           (nth 0 (split-string (buffer-string))))))))
  ;; Treat '_' as part of the word
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'python-mode-hook 'pyvenv-autoload)
  (evil-leader/set-key-for-mode 'python-mode "t" 'elpy-test)
  (evil-leader/set-key-for-mode 'python-mode "d" 'elpy-goto-definition)
  (evil-leader/set-key-for-mode 'python-mode "b" 'elpy-black-fix-code)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--no-autoindent --no-color-info --no-banner --no-confirm-exit  --simple")
  (setq elpy-rpc-backend "jedi"))

(use-package blacken
  :ensure t
  :defer t
  :after (elpy))

;; RUST Mode
(use-package rust-mode
  :ensure t
  :defer t
  :config
  (evil-leader/set-key-for-mode 'rust-mode "d" 'racer-find-definition)
  (progn
    (use-package racer
      :ensure t
      :config
      (setq racer-rust-src-path
            "/home/docler/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"))
    (use-package flycheck-rust
      :ensure t
      :config
      (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)
    (add-hook 'rust-mode-hook #'electric-pair-mode)
    (setq rust-format-on-save t)))

;; Services
(use-package prodigy
  :ensure t
  :defer t
  :bind ("C-c s" . prodigy)
  :config
  (add-hook 'prodigy-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "r") 'prodigy-restart)
              (define-key evil-normal-state-local-map (kbd "f") 'prodigy-add-tag-filter)
              (define-key evil-normal-state-local-map (kbd "F") 'prodigy-clear-filters)
              (define-key evil-normal-state-local-map (kbd "J") 'prodigy-next-with-status)
              (define-key evil-normal-state-local-map (kbd "K") 'prodigy-prev-with-status)
              (define-key evil-normal-state-local-map (kbd "o") 'prodigy-display-process)
              (define-key evil-normal-state-local-map (kbd "m") 'prodigy-mark)
              (define-key evil-normal-state-local-map (kbd "M") 'prodigy-mark-all)
              (define-key evil-normal-state-local-map (kbd "s") 'prodigy-start)
              (define-key evil-normal-state-local-map (kbd "S") 'prodigy-stop)))
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
  )

;; Set back to its default value
(setq gc-cons-threshold 800000)
