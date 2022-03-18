(setq org-publish-project-alist
      '(("body"
	 ;; generic
         :base-directory "org"
         :base-extension "org"
         :publishing-directory "public"
         :recursive nil
	 :language en
	 :with-latex t
	 ;; html
	 :html-head "<link rel='stylesheet' href='../css/org.css' type='text/css' /> <link rel='stylesheet' href='../css/custom.css' type='text/css' /> <link rel='icon' href='../attach/desktop.svg'>"
         :publishing-function org-html-publish-to-html
	 ;; sitemap
	 :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "Computer Docs"
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
         :base-directory "attach/"
         ;; :base-extension "png\\|jpg\\|ico"
         :base-extension "png\\|jpg\\|ico\\|svg"
         :publishing-directory "public/attach"
         :publishing-function org-publish-attachment
         :recursive t)
	("all" :components ("body" "css" "attach"))))
