;; =========================
;; package system
(require 'package)
(package-initialize)

;; =========================
;; custom文件设置
(setq custom-file "~/.emacs.custom")
(load custom-file 'noerror)

;; =========================
;; Theme
(load-theme 'gruber-darker t)

;; =========================
;; 启动优化（尽量靠前）
(setq inhibit-startup-message t) ;; 去除欢迎界面
(setq frame-inhibit-implied-resize t) ;; 禁止 frame 自动调整尺寸

(setq default-frame-alist
      '((font . "Iosevka-17"))) ;; 设置默认字体

(setq initial-frame-alist default-frame-alist)  ;; 强制初始 frame 使用同样配置

(setq display-line-numbers-type 'relative)  ;; 相对行数指示
(global-display-line-numbers-mode 1)  ;; 显示行号

;; =========================
;; 编码：全部使用 UTF-8
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8-unix)

;; =========================
;; Python + Pyright + Eglot
;; =========================
(require 'eglot)
;; 自动启用 pyright
(add-to-list 'eglot-server-programs
             '(python-mode . ("pyright-langserver" "--stdio")))
(add-hook 'python-mode-hook 'eglot-ensure)

;; =========================
;; 安装corfu
(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

;; =========================
;; TAB补全  
(setq tab-always-indent 'complete)

(defun my/tab-indent-or-complete ()
  (interactive)
  (if (or (looking-at "\\_>")
          (company-manual-begin)
          (completion-at-point))
      (completion-at-point)
    (indent-for-tab-command)))

(global-set-key (kbd "TAB") 'my/tab-indent-or-complete)
