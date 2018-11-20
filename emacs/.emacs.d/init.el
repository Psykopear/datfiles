(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'load-path "/usr/lib/node_modules/tern/emacs/")
(add-to-list 'load-path "~/.emacs.d/lisp")

(add-to-list 'load-path "~/.emacs.d/lisp/emacs-application-framework")
(require 'eaf)

(autoload 'tern-mode "tern.el" nil t)

(package-initialize)
(elpy-enable)


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
 '(custom-safe-themes
   (quote
    ("d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "eae831de756bb480240479794e85f1da0789c6f2f7746e5cc999370bbc8d9c8a" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "718fb4e505b6134cc0eafb7dad709be5ec1ba7a7e8102617d87d3109f56d9615" "aded4ec996e438a5e002439d58f09610b330bbc18f580c83ebaba026bbef6c82" "41eb3fe4c6b80c7ad156a8c52e9dd6093e8856c7bbf2b92cc3a4108ceb385087" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "7559ac0083d1f08a46f65920303f970898a3d80f05905d01e81d49bb4c7f9e39" "ea9e9f350c019474a5265c08f7441027b23c1da3f23b9c30517d60133bab679f" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" default)))
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(global-auto-revert-mode t)
 '(inhibit-startup-screen t)
 '(neo-confirm-create-directory (quote off-p))
 '(neo-confirm-create-file (quote off-p))
 '(org-agenda-files (quote ("~/Agenda.org")))
 '(package-selected-packages
   (quote
    (realgud docker treemacs-projectile treemacs-evil treemacs evil-magit magit magithub auto-package-update qml-mode csv-mode dockerfile-mode graphql-mode blacken jinja2-mode feature-mode gherkin-mode markdown-mode prettier-js yarn-mode all-the-icons rust-mode writeroom-mode importmagic flow-minor-mode groovy-mode helm-ag pycoverage highlight-numbers js2-refactor js2-highlight-vars flatui-dark-theme base16-theme challenger-deep-theme aggressive-indent ace-window company-jedi pipenv elm-mode elpy evil-numbers ws-butler evil-nerd-commenter avy evil-smartparens highlight-indentation yaml-mode toml-mode gdscript-mode fzf auto-virtualenvwrapper company-tern rg evil-leader material-theme flycheck centered-cursor-mode rainbow-delimiters helm-projectile rjsx-mode dashboard projectile helm key-chord evil neotree)))
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
;;
;; No tabs
(setq-default indent-tabs-mode nil) ;; No backup/save files
(setq make-backup-files nil) ;; No scroll bar
(scroll-bar-mode -1)
(menu-bar-mode -1)


(load-theme 'base16-materia t)
(setq base16-distinct-fringe-background nil)

;; (load-theme 'material t)
;; (load-theme 'challenger-deep t)
;; (load-theme 'base16-railscasts t)

(global-linum-mode 1)
(require 'linum-highlight-current-line-number)
;; (setq linum-format "%4d")
; (setq linum-format "%4d\u2502")
(setq linum-format 'linum-highlight-current-line-number)

;; (setq-default left-fringe-width  0)
(setq-default left-fringe-width  10)
;; (setq-default right-fringe-width  10)
(setq-default right-fringe-width  0)
;; (setq git-gutter-fr:side 'right-fringe)
(setq git-gutter-fr:side 'left-fringe)

(setq create-lockfiles nil)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq auto-save-default nil)

;; RIPGREP
(require 'rg)
(rg-enable-default-bindings (kbd "M-s"))
;; Trim whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; HELM
(require 'helm-config)
(helm-mode 1)

;; Vim simulation
(require 'evil)
(evil-mode 1)
(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
            (define-key evil-normal-state-local-map (kbd "ma") 'neotree-create-node)
            (define-key evil-normal-state-local-map (kbd "C") 'neotree-change-root)
            (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
(setq neo-theme 'ascii)

(global-set-key (kbd "C-s") 'ace-swap-window)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)
(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "M-k") 'shrink-window)
(global-set-key (kbd "M-j") 'enlarge-window)
(global-set-key (kbd "M-h") 'shrink-window-horizontally)
(global-set-key (kbd "M-l") 'enlarge-window-horizontally)

;; You need to install fringe-helper.el
(require 'git-gutter-fringe)
(global-git-gutter-mode 1)

;; Function to open config file
(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))


; Evil leader
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "ev" 'find-user-init-file
  "w" 'save-buffer
  "f" 'fzf-git-files
  "a" 'rg-dwim
  "A" 'rg-literal
  "c" 'kill-this-buffer
  "g" 'evilnc-comment-or-uncomment-lines
  "q" 'delete-window
  "h" 'split-window-vertically
  "m" 'toggle-truncate-lines
  ",w" 'avy-goto-word-0
  "v" 'split-window-horizontally)


;; Esco with JJ for evil mode
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;; File explorer
(require 'neotree)
(global-set-key [f3] 'neotree-toggle)
;; (setq neo-smart-open t)
;; (setq neo-vc-integration t)
;; (setq neo-autorefresh t)
(setq neo-window-width 25)
(setq neo-window-fixed-size nil)
;; (global-set-key [f3] 'treemacs)
;; (treemacs-toggle-fixed-width 0)
;; (treemacs-resize-icons 18)

;; Start screen
;; (require 'dashboard)
;; (dashboard-setup-startup-hook)
;; (setq dashboard-items '((recents . 5)
;;                         (projects . 5)))


(require 'helm-projectile)
(helm-projectile-on)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-switch-project-action 'neotree-projectile-action)

;; Rainbow
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Ace-window
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; Vertically centered cursors
(and
 (require 'centered-cursor-mode)
 (global-centered-cursor-mode +1))

(add-hook 'after-init-hook #'global-flycheck-mode)

;; JS config
(require 'rjsx-mode)
(require 'company)
(require 'company-tern)
(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (evil-leader/set-key "d" 'tern-find-definition)
                           (prettier-js-mode)
                           (company-mode)
                           (evil-smartparens-mode t)
                           (smartparens-mode t)
                           (tern-mode t)
                           ))
(setq-default js2-basic-offset 2)
(setq js-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(setq flycheck-disabled-checkers '(javascript-jshint))
(setq flycheck-checkers '(javascript-eslint))


(add-hook 'elpy-mode-hook (lambda ()
                            (evil-smartparens-mode t)
                            (blacken-mode)
                            (smartparens-mode t)
                            (evil-leader/set-key "d" 'elpy-goto-definition)))
(setq elpy-rpc-backend "jedi")
(add-hook 'python-mode-hook #'pipenv-mode)
;; (require 'auto-virtualenvwrapper)
;; (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)

;; Folding
(add-hook 'prog-mode-hook
          (lambda () (hs-minor-mode) (evil-close-folds)))


(require 'toml-mode)
;; Register the desired extensions.
(dolist (pattern '("\\.tscn\\'"))
  (add-to-list 'auto-mode-alist (cons pattern 'toml-mode)))


(require 'gdscript-mode)
;; Register the desired extensions.
(dolist (pattern '("\\.gd\\'"))
  (add-to-list 'auto-mode-alist (cons pattern 'gdscript-mode)))

;; Scrolling
(setq redisplay-dont-pause t
  scroll-margin 10
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(highlight-indentation-mode 0)
(global-set-key (kbd "C-;") 'avy-goto-char)

(require 'ws-butler)
(add-hook 'prog-mode-hook #'ws-butler-mode)

(require 'evil-numbers)

(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-visual-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-z") 'evil-numbers/dec-at-pt)
(define-key evil-visual-state-map (kbd "C-z") 'evil-numbers/dec-at-pt)
;; (define-key evil-normal-state-map (kbd "<tab>") 'next-buffer)
;; (define-key evil-visual-state-map (kbd "<S-tab>") 'previous-buffer)


(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--no-autoindent --no-color-info --no-banner --no-confirm-exit  --simple")
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

(defun new-line-dwim ()
  (interactive)
  (let ((break-open-pair (or (and (looking-back "{") (looking-at "}"))
                             (and (looking-back ">") (looking-at "<"))
                             (and (looking-back "(") (looking-at ")"))
                             (and (looking-back "\\[") (looking-at "\\]")))))
    (newline)
    (when break-open-pair
      (save-excursion
        (newline)
        (indent-for-tab-command)))
    (indent-for-tab-command)))
(global-set-key (kbd "RET") 'new-line-dwim)

;;; SCLANG
(add-to-list 'load-path "/usr/share/SuperCollider/Extensions/scide_scel")
(require 'sclang)
(require 'nav-flash)
(require 'hl-line+)

;; Function that flashes current line and sends data to python shell
(defun flash-send ()
  (interactive)
  (elpy-shell-send-statement)
  (flash-line-highlight))

(define-key evil-visual-state-map (kbd "C-<return>") 'flash-send)
(define-key evil-normal-state-map (kbd "C-<return>") 'flash-send)
(define-key evil-insert-state-map (kbd "C-<return>") 'flash-send)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
