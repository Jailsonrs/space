(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(defun then_R_operator ()
  "R - %>% operator or 'then' pipe operator"
  (interactive)
  (just-one-space 1)
  (insert "%>%")
  (reindent-then-newline-and-indent))
(define-key ess-mode-map (kbd "M-1") 'then_R_operator)
(define-key inferior-ess-mode-map (kbd "M-1") 'then_R_operator)

(require 'python)
(setq python-shell-interpreter "ipython3")
(setq python-shell-interpreter-args "--pylab")

(defun then_R_operator1 ()
  "R - %in% operator or 'then' pipe operator"
  (interactive)
  (just-one-space 1)
  (insert "%in%")
  (just-one-space 1))
(define-key ess-mode-map (kbd "M-2") 'then_R_operator1)
(define-key inferior-ess-mode-map (kbd "M-2") 'then_R_operator1)

(require 'auto-complete)
(global-auto-complete-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3f3f3f" "#ea3838" "#7fb07f" "#fe8b04" "#62b6ea" "#e353b9" "#1fb3b3" "#d5d2be"])
 '(column-number-mode nil)
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "d9129a8d924c4254607b5ded46350d68cc00b6e38c39fc137c3cfb7506702c12" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(display-battery-mode t)
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(ess-swv-processor (quote knitr))
 '(fci-rule-color "#222222")
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(gnus-logo-colors (quote ("#2fdbde" "#c0c0c0")))
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")))
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tabbar-mode t nil (tabbar))
 '(tool-bar-mode nil)
 '(tooltip-mode t)
 '(uniquify-buffer-name-style nil nil (uniquify))
 '(vc-annotate-background "#222222")
 '(vc-annotate-color-map
   (quote
    ((20 . "#db4334")
     (40 . "#ea3838")
     (60 . "#abab3a")
     (80 . "#e5c900")
     (100 . "#fe8b04")
     (120 . "#e8e815")
     (140 . "#3cb370")
     (160 . "#099709")
     (180 . "#7fb07f")
     (200 . "#32cd32")
     (220 . "#8ce096")
     (240 . "#528d8d")
     (260 . "#1fb3b3")
     (280 . "#0c8782")
     (300 . "#30a5f5")
     (320 . "#62b6ea")
     (340 . "#94bff3")
     (360 . "#e353b9"))))
 '(vc-annotate-very-old-color "#e353b9"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "APPL" :slant normal :weight normal :height 98 :width normal)))))
(require 'markdown-mode)


(defun rmd-mode ()
  "ESS Markdown mode for rmd files"
  (interactive)
  (setq load-path 
    (append (list "path/to/polymode/" "path/to/polymode/modes/")
        load-path))
  (require 'poly-R)
  (require 'poly-markdown)     
  (poly-markdown+r-mode))


(setq tex-dvi-view-command "(f=*; pdflatex \"${f%.dvi}.tex\" && open \"${f%.dvi}.pdf\")")

(defun insert-latex-template()
  (when (= (point-max) (point-min))
    (insert-file "~/tex/template1.tex")))

(add-hook 'latex-mode-hook 'insert-latex-template)
 (require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
