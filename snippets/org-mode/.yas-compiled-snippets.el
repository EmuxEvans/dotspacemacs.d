;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("week" "`(get-china-week)` `(get-china-date)`\n     $1\n" "week time" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/week" nil nil)
                       ("verse" "#+begin_verse\n        $0\n#+end_verse" "verse" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/verse" nil nil)
                       ("name" "#+srcname: $0" "srcname" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/srcname" nil nil)
                       ("src" "#+begin_src ${1:language}\n$0\n#+end_src\n" "src" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/src" nil nil)
                       ("uml" "#+BEGIN_SRC plantuml :file res/${1:file}.png  :cmdline -charset UTF-8\n    $0\n#+END_SRC" "plantuml" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/plantuml" nil nil)
                       ("node" "t${1:0} [ label = \"${2:label}\" ];\n$0" "node" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/node" nil nil)
                       ("more" "#+BEGIN_HTML\n<!--more-->\n#+END_HTML\n" "more" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/more" nil nil)
                       ("meeting" "* `(get-china-week)`\n** 王进銮\n*** Homekit 吸顶灯 [/]\n     $1\n** 卢鹏飞\n*** 菱形网关 [/]\n** 曾繁书\n*** C019 高端网关 [/]\n** 林连杰\n*** Loop [/]\n** 潘紫东\n*** C033 高端网关 [/]\n" "week meeting" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/meeting" nil nil)
                       ("matrix" "\\left \\(\n\\begin{array}{${1:ccc}}\n${2:v1 & v2} \\\\\n$0\n\\end{array}\n\\right \\)" "matrix" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/matrix" nil nil)
                       ("latex" "\n#+TITLE: $1\n#+AUTHOR: $2\n#+EMAIL: $3\n#+OPTIONS: toc:3 num:nil\n#+STARTUP: overview\n#+LATEX_HEADER: \\usepackage{xltxtra}\n#+LATEX_HEADER: \\setmainfont{Hiragino Sans GB}\n#+LATEX_HEADER: \\usepackage[paperheight=13in,paperwidth=14in]{geometry}\n#+HTML_HEAD: <link rel=\"stylesheet\" type=\"text/css\" href=\"http://thomasf.github.io/solarized-css/solarized-light.min.css\" />" "latex" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/latex" "direct-keybinding" nil)
                       ("kanban" "\n| BACKLOG | TODO | STARTED | QA | BUG | DONE |\n|---------+------+---------+----+-----+------|\n|         |      |         |    |     |      |\n#+TBLFM: @2\\$1..@>$$>>='(kanban-zero @# \\$# nil '(\"$0\"))::@1='(kanban-headers \\$#)\n\n" "kanban" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/kanban" nil nil)
                       ("img" "<img src=\"$1\"\n alt=\"$2\" align=\"${3:left}\"\n title=\"${4:image title}\"\n class=\"img\"\n</img>\n$0" "img" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/img" nil nil)
                       ("good" "`(get-china-week)` `(get-china-date)` `(get-baidu-weather)`					:`(format-time-string \"%Y\")`:`(format-time-string \"%Y\")``(format-time-string \"%m\")`:\n     $1" "good morning" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/good" nil nil)
                       ("fig" "#+CAPTION: ${1:caption}\n#+ATTR_LaTeX: ${2:scale=0.75}\n#+LABEL: fig:${3:label}\n" "figure" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/figure" nil nil)
                       ("entry" "#+begin_html\n---\nlayout: ${1:default}\ntitle: ${2:title}\n---\n#+end_html\n$0" "entry" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/entry" nil nil)
                       ("emb" "src_${1:lang}${2:[${3:where}]}{${4:code}}" "embedded" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/embedded" nil nil)
                       ("elisp" "#+begin_src emacs-lisp :tangle yes\n$0\n#+end_src" "elisp" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/elisp" nil nil)
                       ("dot" "#+BEGIN_SRC dot :file res/${1:file}.png :cmdline -Kdot -Tpng\n    $0\n#+END_SRC" "dot" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/dot" nil nil)
                       ("ditaa" "#+BEGIN_SRC ditaa :file res/${1:file}.png :cmdline -o -E -s 0.8\n    $0\n#+END_SRC" "ditaa" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/ditaa" nil nil)
                       ("date" "`(cal-china-x-chinese-current-date-string)`" "insert full date" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/date" nil nil)
                       ("curly" "${1:def} =\n\\left \\{\n\\begin{array}{ll}\n$0\n\\end{array}\n\\right" "curly" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/curly" nil nil)
                       ("crypt" "-*- mode: org; epa-file-encrypt-to: (“andrea.crotti.0@gmail.com”) -*-\n$0" "crypt" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/crypt" nil nil)
                       ("comments" "#+JEKYLL_COMMENTS: true" "comments" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/comments" "direct-keybinding" nil)
                       ("code" "#+begin_${1:lang} ${2:options}\n$0\n#+end_$1" "code" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/code" nil nil)
                       ("blog" "#+STARTUP: showall indent\n#+STARTUP: hidestars\n#+BEGIN_HTML\n---\nlayout: default\ntitle: ${1:title}\nexcerpt: ${2:excerpt}\n---\n$0" "blog" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/blog" nil nil)
                       ("beamer" "#+STARTUP: beamer\n#+OPTIONS: toc:nil\n#+LANGUAGE: ${1:it}\n#+LaTeX_CLASS: beamer\n#+LaTeX_CLASS_OPTIONS: [presentation]\n#+BEAMER_FRAME_LEVEL: 2\n#+BEAMER_HEADER_EXTRA: \\usetheme{Berlin} \\usecolortheme{default}\n#+COLUMNS: %40ITEM %10BEAMER_env(Env) %10BEAMER_envargs(Env Args) %4BEAMER_col(Col) %8BEAMER_extra(Extra)\n#+TITLE: ${2:TITLE}\n\n$0\n" "beamer" nil nil nil "/Users/evans/.spacemacs.d/snippets/org-mode/beamer" nil nil)))


;;; Do not edit! File generated at Sun Dec 25 22:07:25 2016
