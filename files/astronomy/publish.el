(require 'ox-publish)

;; (defun my-website-sitemap-function (project &optional sitemap-filename)
;;   "Custom sitemap generator that inserts additional options."
;;   (let ((buffer (org-publish-org-sitemap project sitemap-filename)))
;;     (with-current-buffer buffer
;;       (insert "\n#+SETUPFILE: ../style/default.setup")
;;       (save-buffer))))

;; sitemap function
(defun @-org-publish-org-sitemap (title list)
  "Sitemap generation function."
  (concat (format "#+TITLE: %s\n" title)
	  "\n#+SETUPFILE: ../style/default.setup\n"
          "#+OPTIONS: toc:nil\n"
          ;; "* Articals\n"
          ;; (replace-regexp-in-string "\*" "-" (org-list-to-subtree list))
          (org-list-to-subtree list)
          "\n\n"
          ;; (@-load-file-contents (expand-file-name "~/.emacs.d/aboutme.org"))
          ))


;; (defun my-website-html-postamble (options)
;;   (concat "<hr>"
;;           ;; (if (and (plist-get options ':keywords) (not (string= (plist-get options ':keywords) "")))
;;           ;;     (format "<p>Keywords: %s</p>" (plist-get options ':keywords))
;;           ;;     "")
;;           (format "<p class=\"date\">Modified: %s</p>" (format-time-string "%Y-%m-%d %H:%M:%S"))
;;           (format "<p>Copyright (c) %s %s</p>"
;;                   (car (split-string (car (plist-get options ':date)) "-")) ;; TODO: get from custom document option
;;                   (car (plist-get options ':author)))
;;           (format "<p>%s</p>" (plist-get options ':creator))))

;; inline image size
(setq org-image-actual-width 200)

(setq org-html-validation-link nil)
(defun my-org-html-postamble (plist)
  (concat "<hr>" "<p>Author: <a href='https://www.astro.umd.edu/~chongchong/'>Chong-Chong He</a></p>"
	  (format "<p>Last updated: %s</p>" (format-time-string "%Y-%m-%d"))
	  ))
(setq org-html-postamble 'my-org-html-postamble)

(setq org-publish-project-alist
      '(("body"
	 ;; generic
         :base-directory "org"
         :base-extension "org"
	 :exclude "README.org"
         :publishing-directory "public"
         :recursive nil
	 :language en
	 :with-latex t
	 ;; html
	 :html-head "<link rel='stylesheet' href='css/org.css' type='text/css' /> <link rel='stylesheet' href='css/custom.css' type='text/css' /> <link rel='icon' href='img/favicon.ico'>"
	 ;; :html-postamble my-website-html-postamble
         :publishing-function org-html-publish-to-html
	 ;; :html-doctype "html5"
         ;; :html-html5-fancy t
	 ;; :html-head-extra "<link rel="stylesheet" href="https://gongzhitaao.org/orgcss/org.css" type="text/css" />"
	 ;; sitemap
	 :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "Home"
         ;; :sitemap-sort-files anti-chronologically
         ;; :sitemap-file-entry-format "%d - %t"
         ;; :sitemap-function my-website-sitemap-function
         ;; :sitemap-function org-publish-org-sitemap
         :sitemap-function @-org-publish-org-sitemap
	 ;; :html-home/up-format "<div id=\'org-div-home-and-up-index-page\'> <div> <a accesskey=\'h\' href=\'%s\'> UP </a> | <a accesskey=\'H\' href=\'%s\'> HOME </a> </div> <div> <a href=\'./index.xml\'> RSS </a> | <a href=\'https://github.com/casouri/casouri.github.io\'> Source </a> | <a href=\'https://creativecommons.org/licenses/by-sa/4.0/\'> License </a> </div> </div>"
	 :html-home/up-format "<div> <a accesskey='h' href='index.html'> UP </a> | <a accesskey='H' href='index.html'> HOME </a> </div>"
	 )
	("css"
         :base-directory "style/"
         :base-extension "css\\|js\\|setup"
         :publishing-directory "public/css"
         :publishing-function org-publish-attachment
         :recursive t)
	("attach"
         :base-directory "img/"
         :base-extension "png\\|jpg\\|ico\\|pdf"
         :publishing-directory "public/img"
         :publishing-function org-publish-attachment
         :recursive t)
	("all" :components ("body" "css" "attach"))))
