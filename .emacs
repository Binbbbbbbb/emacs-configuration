;; =========================
;; custom
(setq custom-file "~/.emacs.custom")
(load custom-file 'noerror)

;; =========================
;; 启动优化（尽量靠前）
(setq inhibit-startup-message t)
(setq frame-inhibit-implied-resize t)

(setq default-frame-alist
      '((fullscreen . maximized)
        (font . "Iosevka-20")
        (tool-bar-lines . 0)
        (menu-bar-lines . 0)
        (vertical-scroll-bars . nil)))

(setq initial-frame-alist default-frame-alist)

;; =========================
;; package
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; 如果 use-package 没安装，只在第一次安装时刷新源
(unless (package-installed-p 'use-package)
  (unless package-archive-contents
    (package-refresh-contents))
  (package-install 'use-package))

(require 'use-package)

;; 不全局自动 ensure，避免每次启动都检查所有包
(setq use-package-always-ensure nil)

;; =========================
;; 默认目录
(setq default-directory "E:/codes/emacs files/")

;; =========================
;; UI & 基础体验
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(fido-mode 1)

;; =========================
;; 编码：全部使用 UTF-8
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8-unix)

;; =========================
;; Python 环境路径
(add-to-list 'exec-path "D:/Miniconda/envs/daily-use")
(setenv "PATH"
        (concat "D:/Miniconda/envs/daily-use;" (getenv "PATH")))

(setq python-shell-interpreter "D:/Miniconda/envs/daily-use/python.exe")

;; =========================
;; TAB 补全
(setq tab-always-indent 'complete)

;; =========================
;; 补全：corfu
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

;; =========================
;; protobuf：.proto 文件高亮
(use-package protobuf-mode
  :ensure t
  :mode ("\\.proto\\'" . protobuf-mode))

;; =========================
;; Arduino：.ino 文件高亮
(use-package arduino-mode
  :ensure t
  :mode ("\\.ino\\'" . arduino-mode))

;; =========================
;; LSP
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook ((c-mode . lsp-deferred)
         (c++-mode . lsp-deferred)
         (java-mode . lsp-deferred)
         (csharp-mode . lsp-deferred))
  :config
  (setq lsp-idle-delay 0.1)
  (setq lsp-completion-provider :none)

  ;; 让 lsp-mode 识别 arduino-mode
  (add-to-list 'lsp-language-id-configuration
               '(arduino-mode . "cpp")))

;; =========================
;; Python LSP：pyright
(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))

;; =========================
;; LSP UI
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :commands lsp-ui-mode)