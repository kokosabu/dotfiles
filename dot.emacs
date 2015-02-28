; 以下のファイルを評価する
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/conf")

(require 'yasnippet-bundle)
(require 'color-moccur)

(setq visible-bell t)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

(define-key global-map "\C-h" 'delete-backward-char) ; C-hでdelete
(define-key global-map "\C-x\C-h" 'help) ; C-x C-hでヘルプ
(setq-default transient-mark-mode t) ; マークしているところの色が変わる
(define-key global-map "\C-o" 'dabbrev-expand) ; 略語展開
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
(show-paren-mode t) ; 括弧の対応をハイライト.
(setq next-line-add-newlines nil) ; バッファ末尾に余計な改行コードを防ぐための設定
(define-key ctl-x-map "l" 'goto-line) ; C-x C-l で goto-line を実行
(menu-bar-mode -1) ; メニューバーを消す

;; color
(global-font-lock-mode t)
(setq auto-mode-alist
      (append '(("\\.c$"               . c-mode)
                ("\\.cc$"              . c++-mode)
                ("\\.h$"               . c++-mode)
                ("\\.tex$"             . tex-mode)
                ("\\.html"             . html-mode)
                ("Changelog"           . change-log-mode)
                ("\\.rb"               . ruby-mode)
                ("\\.js\\'"            . js2-mode)
                ("\\.[Pp][LlMm][Cc]?$" . cperl-mode)
                ("\\.el"               . emacs-lisp-mode)
                ("\\.emacs"            . emacs-lisp-mode)
                ("\\.css\\'"           . css-mode))
              auto-mode-alist))

;; others
(setq make-backup-files nil)
(setq c-indent-level 4)
(setq c-continued-statement-offset 4)
(setq next-line-add-newlines nil)
(setq fill-column 78)
(setq auto-fill-mode t)

;; hatena perl setting
(setq cperl-auto-newline t)
(setq cperl-indent-parens-as-block t)
(setq cperl-close-paren-offset -4)
(setq cperl-indent-level 4)
(setq cperl-label-offset -4)
(setq cperl-continued-statement-offset 4)
(setq cperl-highlight-variables-indiscriminately t)

;; c-perl from PERL HACKS
(load-library "cperl-mode")
(while (let ((orig (rassoc 'perl-mode auto-mode-alist)))
         (if orig (setcdr orig 'cperl-mode))))
(while (let ((orig (rassoc 'perl-mode interpreter-mode-alist)))
         (if orig (setcdr orig 'cperl-mode))))
(dolist (interpreter '("perl" "perl5" "miniperl" "pugs"))
  (unless (assoc interpreter interpreter-mode-alist)
    (add-to-list 'interpreter-mode-alist (cons interpreter 'cperl-mode))))
(global-set-key "\M-p" 'cperl-perldoc) ; alt-p

(setq cssm-indent-function #'cssm-c-style-indenter)

;; Gaucheのデフォルトエンコーディングに合わせます。
(setq process-coding-system-alist
            (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
;; goshインタプリタのパスに合わせます。-iは対話モードを意味します。
;; (setq scheme-program-name "/usr/local/bin/gosh -i")
(setq scheme-program-name "gosh -i")
;; schemeモードとrun-schemeモードにcmuscheme.elを使用します。
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
;; ウィンドウを2つに分け、一方でgoshインタプリタを実行するコマンドを定義します。
(defun scheme-other-window ()
    "Run scheme on other window"
      (interactive)
        (switch-to-buffer-other-window
         (get-buffer-create "*scheme*"))
        (run-scheme gosh-program-name))
;; そのコマンドをCtrl-cSで呼び出します。
(define-key global-map
    "\C-cS" 'scheme-other-window)

;; 以下はインデントの定義です。
(put 'and-let* 'scheme-indent-function 1)
(put 'begin0 'scheme-indent-function 0)
(put 'call-with-client-socket 'scheme-indent-function 1)
(put 'call-with-input-conversion 'scheme-indent-function 1)
(put 'call-with-input-file 'scheme-indent-function 1)
(put 'call-with-input-process 'scheme-indent-function 1)
(put 'call-with-input-string 'scheme-indent-function 1)
(put 'call-with-iterator 'scheme-indent-function 1)
(put 'call-with-output-conversion 'scheme-indent-function 1)
(put 'call-with-output-file 'scheme-indent-function 1)
(put 'call-with-output-string 'scheme-indent-function 0)
(put 'call-with-temporary-file 'scheme-indent-function 1)
(put 'call-with-values 'scheme-indent-function 1)
(put 'dolist 'scheme-indent-function 1)
(put 'dotimes 'scheme-indent-function 1)
(put 'if-match 'scheme-indent-function 2)
(put 'let*-values 'scheme-indent-function 1)
(put 'let-args 'scheme-indent-function 2)
(put 'let-keywords* 'scheme-indent-function 2)
(put 'let-match 'scheme-indent-function 2)
(put 'let-optionals* 'scheme-indent-function 2)
(put 'let-syntax 'scheme-indent-function 1)
(put 'let-values 'scheme-indent-function 1)
(put 'let/cc 'scheme-indent-function 1)
(put 'let1 'scheme-indent-function 2)
(put 'letrec-syntax 'scheme-indent-function 1)
(put 'make 'scheme-indent-function 1)
(put 'multiple-value-bind 'scheme-indent-function 2)
(put 'match 'scheme-indent-function 1)
(put 'parameterize 'scheme-indent-function 1)
(put 'parse-options 'scheme-indent-function 1)
(put 'receive 'scheme-indent-function 2)
(put 'rxmatch-case 'scheme-indent-function 1)
(put 'rxmatch-cond 'scheme-indent-function 0)
(put 'rxmatch-if  'scheme-indent-function 2)
(put 'rxmatch-let 'scheme-indent-function 2)
(put 'syntax-rules 'scheme-indent-function 1)
(put 'unless 'scheme-indent-function 1)
(put 'until 'scheme-indent-function 1)
(put 'when 'scheme-indent-function 1)
(put 'while 'scheme-indent-function 1)
(put 'with-builder 'scheme-indent-function 1)
(put 'with-error-handler 'scheme-indent-function 0)
(put 'with-error-to-port 'scheme-indent-function 1)
(put 'with-input-conversion 'scheme-indent-function 1)
(put 'with-input-from-port 'scheme-indent-function 1)
(put 'with-input-from-process 'scheme-indent-function 1)
(put 'with-input-from-string 'scheme-indent-function 1)
(put 'with-iterator 'scheme-indent-function 1)
(put 'with-module 'scheme-indent-function 1)
(put 'with-output-conversion 'scheme-indent-function 1)
(put 'with-output-to-port 'scheme-indent-function 1)
(put 'with-output-to-process 'scheme-indent-function 1)
(put 'with-output-to-string 'scheme-indent-function 1)
(put 'with-port-locking 'scheme-indent-function 1)
(put 'with-string-io 'scheme-indent-function 1)
(put 'with-time-counter 'scheme-indent-function 1)
(put 'with-signal-handlers 'scheme-indent-function 1)
(put 'with-locking-mutex 'scheme-indent-function 1)
(put 'guard 'scheme-indent-function 1)

;; Kernighan & Ritchie スタイルにする
(setq c-default-style "k&r")

;; BackSpace キーを「賢く」し，インデント幅は4桁，タブはスペースに展開
(add-hook 'c-mode-common-hook
          '(lambda ()
             (progn
               (c-toggle-hungry-state 1)
               (setq c-basic-offset 4 indent-tabs-mode nil))))

;; tab, eofとかに色付け
;;(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
;;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
    (font-lock-add-keywords
        major-mode
        '(("\t" 0 my-face-b-2 append)
          ("　" 0 my-face-b-1 append)
          ("[ \t]+$" 0 my-face-u-1 append)
          ;;("[\r]*\n" 0 my-face-r-1 append)
          )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; gtags-mode
(autoload 'gtags-mode "gtags" "" t)
(setq gtats-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)))
(add-hook 'c-mode-common-hook
          '(lambda ()
             (gtags-mode 1)
             (gtags-make-complete-list)))

(add-hook 'c++-mode-hook
          (function (lambda ()
                      (define-key c++-mode-map "\C-c\C-p" 'ff-find-other-file)
                      (define-key c++-mode-map "\C-c\C-n" 'ff-find-other-file))))

;; Clozure CLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "ccl")
;; ~/.emacs.d/slimeをload-pathに追加
(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))
;; SLIMEのロード
(setq slime-lisp-implementaions
      '((ccl ("ccl") :coding-system utf-8-unix)))
(when (require 'slime nil t)
    (slime-setup '(slime-repl slime-fancy slime-banner)))


(when (require 'popwin nil t)
    (setq dispaly-buffer-function 'popwin:display-buffer)
    ;; Apropos
    (push '("*slime-apropos*") popwin:special-display-config)
    ;; Macroexpand
    (push '("*slime-macroexpansion*") popwin:special-display-config)
    ;; Help
    (push '("*slime-description*") popwin:special-display-config)
    ;; Compilation
    (push '("*slime-compilation*" :noselect t) popwin:special-display-config)
    ;; Cross-reference
    (push '("*slime-xref*") popwin:special-display-config)
    ;; Debugger
    (push '(sldb-mode :stick t) popwin:special-display-config)
    ;; REPL
    (push '(slime-repl-mode) popwin:special-display-config)
    ;; Connections
    (push '(slime-connection-list-mode) popwin:special-display-config))

(when (require 'auto-complete-config nil t)
    (add-to-list 'ac-dictionary-directories "/home/miura/.emacs.d/elisp/ac-dict")
    (ac-config-default))

(when (rquire 'ac-slime nil t)
    (add-hook 'slime-mode-hook 'set-up-slime-ac)
    (add-hook 'slime-repl-mode-hook 'set-up-slime-ac))
