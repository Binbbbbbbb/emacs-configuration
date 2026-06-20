;; =========================
;; UI优化
(tool-bar-mode -1)  ;; 去除工具栏
(menu-bar-mode -1)  ;; 去除菜单栏
(scroll-bar-mode -1)  ;; 去除滚动条


;; =========================
;; UI 颜色
(set-face-attribute 'default nil
                    :background "#181818")
(set-face-attribute 'mode-line nil
                    :background "#181818")
(set-face-attribute 'mode-line-inactive nil
                    :background "#181818")

;;====================================
;; 加速配置。
(setq
 ;; 不要缩放frame.
 frame-inhibit-implied-resize t
 ;; 不要自动启用package
 package-enable-at-startup nil
 package--init-file-ensured t
 ;; 不要打印 lexical binding 的日志
 warning-suppress-types '((files)))
;;; init-accelerate.el ends here
