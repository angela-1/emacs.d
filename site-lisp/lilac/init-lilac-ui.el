
;;; ui setting


;; set the English and Chinese font

(defvar lilac-chinese-font nil
  "Auto detect the os system and set the right Chinese font.")

(defvar lilac-english-font nil
  "Auto detect the os system and set the right English font.")


(defun lilac-setup-font (chinese-font english-font font-size)
  "setup the particular font"
  ;; Setting English Font
  (set-face-attribute
   'default nil :font (format "%s %s" english-font font-size))
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font) charset
     (font-spec :family chinese-font)))
  (setq face-font-rescale-alist
        '((english-font . 1.0)
          (chinese-font . 2.0)))
  )



(defun lilac-auto-set-window-font ()
  "Auto detect the os system and set the right font."

  (cond
   ((eq system-type 'windows-nt)
    (progn
      (setq lilac-chinese-font "STKaiTi")
      (setq lilac-english-font "Consolas")))
   ((eq system-type 'gnu/linux)
    (progn
      (setq lilac-chinese-font "FandolKai")
      (setq lilac-english-font "DejaVu Sans Mono")))
   ((eq system-type 'darwin)
    (progn
      (setq lilac-chinese-font "MingLan_Code")
      (setq lilac-english-font "Monaco"))))

  (lilac-setup-font lilac-chinese-font lilac-english-font 14))






(when window-system
  (lilac-auto-set-window-font))



; (when (fboundp 'tool-bar-mode)
;   (tool-bar-mode -1))

; (menu-bar-mode -1)

; ;; the blinking cursor is nothing, but an annoyance
; (blink-cursor-mode -1)


; (setq-default indent-tabs-mode nil)

; ;; disable the annoying bell ring
; (setq ring-bell-function 'ignore)

; ;; disable startup screen
; (setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(show-paren-mode 1)

;; enable y/n answers
;(fset 'yes-or-no-p 'y-or-n-p)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
; (setq frame-title-format
;       '("" invocation-name " lilac - "
;         (:eval (if (buffer-file-name)
;                    (abbreviate-file-name (buffer-file-name))
;                  "%b"))))


;; set theme
; (require-package 'monokai-theme)
; (load-theme 'monokai t)
;(load-theme 'leuven t)


; (require-package 'smart-mode-line)


;; (require 'smart-mode-line)
;; (setq sml/no-confirm-load-theme t)
;; ;; delegate theming to the currently active theme
;; (setq sml/theme nil)
;; (add-hook 'after-init-hook #'sml/setup)

;; ;; show the cursor when moving after big movements in the window

;; (require-package 'beacon)

;; (require 'beacon)
;; (beacon-mode t)


;; ;; volatile-highlights
;; (require-packages '(volatile-highlights diminish))
;; (require 'volatile-highlights)
;; (volatile-highlights-mode t)
;; (diminish 'volatile-highlights-mode)



(provide 'init-lilac-ui)
