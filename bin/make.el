(require 'package)
(require 'org)

;; don't make backup~ files
(setq make-backup-files nil)

(setq org-html-preamble-format
      '(("en"
	 "<a href=https://%t><h1 class=\"title\">%t</h1></a>
	  <p class=\"subtitle\"><i>%a</i></p>
	  <p class=\"subtitle\">%e</p>
	  <p class=\"subtitle\">%d </p><br></br>")))

(defun tangle (source mode)
  (interactive "sFile to tangle: \nsMode to tangle: ")
  (org-babel-tangle-file source nil mode))

(defun make-html (source target)
  (interactive "sFile to export: \nsFile to save as: ")
  ;; css lives separately
  (setq org-html-htmlize-output-type 'css)
  (setq org-html-self-link-headlines t)
  (with-current-buffer (find-file-noselect source)
    (org-export-to-file 'html target)))

(defun make-css (source target)
  (interactive "sFile to export css from: \nsFile to save as: ")
  ;; load theme for css export
  (require 'solarized-theme)
  (load-theme 'solarized-light t)
  (with-current-buffer (find-file-noselect source)
    (org-html-htmlize-generate-css)
    (with-current-buffer "*html*"
      (write-file target))
    (kill-emacs)))
