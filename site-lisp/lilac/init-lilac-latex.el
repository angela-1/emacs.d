
;;; latex settings


(maybe-require-package 'auctex)
(maybe-require-package 'cdlatex)

(after-load 'company
  (maybe-require-package 'company-auctex)
  (company-auctex-init))




;; AUCTeX configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)


(setq-default TeX-master nil)

;; use pdflatex
                                        ;(setq TeX-engine (quote xetex))
                                        ;(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

(defun lilac-latex-mode-default ()
  "Default hook for `LaTeX-mode'."
  (turn-on-auto-fill)
  (abbrev-mode +1)
  (LaTeX-math-mode +1)

  (setq TeX-engine 'xetex       ; use xelatex default
	TeX-show-compilation nil) ; display compilation windows
  (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
  (setq TeX-save-query nil)
                                        ;(imenu-add-menubar-index)
  (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol))

(setq lilac-latex-mode-hook 'lilac-latex-mode-default)

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (run-hooks 'lilac-latex-mode-hook)))







(provide 'init-lilac-latex)
;;; init-lilac-latex.el ends here
