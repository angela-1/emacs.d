;;; lilac-eim.el --- eim configuration.
;;

;;; Code:

(autoload 'eim-use-package
  "eim" "Another emacs input method")


(setq eim-use-tooltip nil)

(register-input-method
 "eim-wb" "euc-cn" 'eim-use-package
 "五笔" "汉字五笔输入法" "wb.txt")


(set-input-method 'eim-wb)
(toggle-input-method)

;; ;; 用 ; 暂时输入英文
;; (require 'eim-extra)
;; (global-set-key [(shift)] 'eim-insert-ascii)


(provide 'init-lilac-eim)

;;; lilac-eim.el ends here

