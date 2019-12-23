(TeX-add-style-hook
 "cv"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("resume" "letterpaper")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "left=0.75in" "top=1in" "right=0.75in" "bottom=0.6in")))
   (TeX-run-style-hooks
    "latex2e"
    "resume"
    "resume10"
    "enumitem"
    "geometry")
   (TeX-add-symbols
    '("itab" 1)
    '("tab" 1)
    "myspace"))
 :latex)

