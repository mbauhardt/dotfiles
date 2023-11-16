(defun mb/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))
(add-hook 'emacs-startup-hook #'mb/display-startup-time)



;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; NOTE: If you want to move everything out of the ~/.emacs.d folder
;; reliably, set `user-emacs-directory` before loading no-littering!
;(setq user-emacs-directory "~/.cache/emacs")

(use-package no-littering)
(no-littering-theme-backups)





					; ========= VIM =============

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))




					; ===== COMPLETION ========


;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))



;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings in `mode-specific-map'
         ;; C-x bindings in `ctl-x-map'
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ;; M-s bindings in `search-map'
         ("M-s f" . consult-fd)                  ;; Alternative: consult-fd
         ("M-s g" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element
)


(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc.  You may adjust the Eldoc
  ;; strategy, if you want to see the documentation from multiple providers.
  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))


					; =========  Projects and Workspaces  ===========
(use-package tabspaces
  :hook (after-init . tabspaces-mode) ;; use this only if you want the minor-mode loaded at startup. 
  :commands (tabspaces-switch-or-create-workspace
             tabspaces-open-or-create-project-and-workspace)
  :custom
  (tabspaces-use-filtered-buffers-as-default t)
  (tabspaces-default-tab "Default")
  (tabspaces-remove-to-default t)
  (tabspaces-include-buffers '("*scratch*"))
  (tabspaces-initialize-project-with-todo t)
  (tabspaces-todo-file-name "project-todo.org")
  ;; sessions
  (tabspaces-session t)
  (tabspaces-session-auto-restore t))


					; ======= Mail ========

(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)

(setq user-full-name "Marko Bauhardt"
      user-mail-address "mb@datameer.com")

;; use mu4e for e-mail in emacs
(setq mail-user-agent 'mu4e-user-agent)

;; path to our Maildir directory
(setq mu4e-maildir "~/var/mail/datameer.com")

(setq mu4e-sent-folder "/datameer.com/sent"
      mu4e-drafts-folder "/datameer.com/drafts"
      mu4e-trash-folder "/datameer.com/trash"
      smtpmail-smtp-user "mb@datameer.com"
      mu4e-compose-signature "---\nMarko Bauhardt")

(add-to-list 'mu4e-bookmarks
'(:name  "Jira"
    :query "maildir:\"/datameer.com/inbox\" flag:unread subject:\"JIRA\""
    :key   ?j))
(add-to-list 'mu4e-bookmarks
'(:name  "Code Review - Europa"
    :query "maildir:\"/datameer.com/inbox\" flag:unread subject:\"datameer inc europa\""
    :key   ?e))
(add-to-list 'mu4e-bookmarks
'(:name  "Code Review - DAP"
    :query "maildir:\"/datameer.com/inbox\" flag:unread subject:\"datameer inc dap\""
    :key   ?d))
(add-to-list 'mu4e-bookmarks
'(:name  "Code Review - Cloud Infrastructure"
    :query "maildir:\"/datameer.com/inbox\" flag:unread subject:\"datameer inc cloud infrastructure\""
    :key   ?r))
(add-to-list 'mu4e-bookmarks
'(:name  "Component Update - Cloud Infrastructure"
    :query "maildir:\"/datameer.com/inbox\" flag:unread subject:\"datameer inc cloud infrastructure component\""
    :key   ?c))
(add-to-list 'mu4e-bookmarks
'(:name  "Code Review - Helm"
    :query "maildir:\"/datameer.com/inbox\" flag:unread subject:\"datameer inc helm int\""
    :key   ?h))
(add-to-list 'mu4e-bookmarks
'(:name  "Upgrade Artifact - Helm"
    :query "maildir:\"/datameer.com/inbox\" flag:unread subject:\"datameer inc helm int Uprade Artifact\""
    :key   ?a))

(setq sendmail-program "/usr/bin/msmtp"
  send-mail-function 'smtpmail-send-it
  message-sendmail-f-is-evil t
  message-sendmail-extra-arguments '("")
  message-send-mail-function 'message-send-mail-with-sendmail)





					; ======= git ==========

(use-package magit)

					; ======= Prefix Key ========

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package general)
(require 'general)

(general-create-definer my-leader-def
  ;; :prefix my-leader
  :prefix "SPC")

;; ** Global Keybindings
(my-leader-def
  :keymaps 'normal
  ;; workspaces
  "<tab>." 'tabspaces-switch-or-create-workspace
  "<tab>k" 'tabspaces-kill-buffers-close-workspace
  ;; projects
  "pp" 'tabspaces-open-or-create-project-and-workspace
  "p." 'project-dired
  "pd" 'project-find-dir
  "SPC" 'project-find-file
  ;; buffer
  "bb" 'consult-project-buffer
  "bk" 'kill-current-buffer
  ;; search
  "." 'find-file
  "*" 'consult-ripgrep
  "l" 'consult-line
  ;; goto
  "gl" 'consult-goto-line
  "go" 'consult-outline
  ;; windows
  "wu" 'winner-undo
  "wn" 'evil-window-down
  "wp" 'evil-window-up
  "wb" 'evil-window-left
  "wf" 'evil-window-right
  ;; git
  "gg" 'magit-status)



					; ======== Lang =========


(use-package yaml-mode)
(use-package highlight-indentation
  :config
  (highlight-indentation-mode t)
  (highlight-indentation-current-column-mode t))
(set-face-background 'highlight-indentation-face "#eceff4")
(set-face-background 'highlight-indentation-current-column-face "#b48ead")


(use-package terraform-mode)


(use-package flycheck)
(global-flycheck-mode)

(use-package ledger-mode)

(defun aj-toggle-fold ()
  "Toggle fold all lines larger than indentation on current line"
  (interactive)
  (let ((col 1))
    (save-excursion
      (back-to-indentation)
      (setq col (+ 1 (current-column)))
      (set-selective-display
       (if selective-display nil (or col 1))))))
					; ========= HISTORY =============


(recentf-mode 1)

;; Save what you enter into minibuffer prompts
(setq history-length 25)
(savehist-mode 1)

;; Remember and restore the last cursor location of opened files
(save-place-mode 1)

;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Don't pop up UI dialogs when prompting
(setq use-dialog-box nil)

;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)

;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)


; ======== Basic UI ===========

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell nil)

(column-number-mode t)
(global-display-line-numbers-mode t)



; =========  Theme ============


(hl-line-mode 1)

;; Configure the Modus Themes' appearance
(setq modus-themes-mode-line '(accented borderless)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-fringes 'subtle
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-prompts '(bold intense)
      modus-themes-org-blocks 'tinted-background
      modus-themes-scale-headings t
      modus-themes-region '(bg-only)
      modus-themes-syntax '(green-strings yellow-comments)
      modus-themes-completions '(opinionated)
      modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))

;; Load the dark theme by default
(load-theme 'modus-vivendi t)
