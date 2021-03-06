;;; Compiled snippets and support files for `js-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js-mode
                     '(("req.json" "new Request.JSON({\n  onSuccess: function(responseJSON, responseText) {\n    $0\n  }\n}).${1:send}(${2:url});" "json" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/req.json" nil nil)
                       ("req.html" "new Request.HTML({\n  onSuccess: function(responseTree, responseElements, responseHTML, responseJavaScript) {\n    $0\n  }\n}).${1:get}(${2:url});" "html" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/req.html" nil nil)
                       ("log" "console.log($0);" "console.log" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/log" nil nil)
                       ("init" "initialize: function($1) {\n  $0\n}" "Constructor" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/init" nil nil)
                       ("if" "if (${1:condition}) {\n  $0\n}" "if" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/if" nil nil)
                       ("for" "for(var ${1:i} = ${2:0}; $1 < ${3:collection}.length; $1++) {\n  $0\n}" "for" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/for" nil nil)
                       ("f" "function($1) {\n  $0\n}" "anonymous function" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/f" nil nil)
                       ("ev.fire" "fireEvent('$0')" "fireEvent" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/ev.fire" nil nil)
                       ("ev.add" "addEvent('${1:event}', function($2) {\n  $0\n});" "addEvent" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/ev.add" nil nil)
                       ("el" "else {\n  $0\n}" "else" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/el" nil nil)
                       ("each" "${1:collection}.each(function($2) {\n  $0\n});" "each" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/each" nil nil)
                       ("def" "${1:name}: function($2) {\n  $0\n}" "function" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/def" nil nil)
                       ("com" "/*\n * $0\n */" "comment (/* ... */)" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/com" nil nil)
                       ("class" "var ${1:name} = new Class({\n  initialize: function($2) {\n    $0\n  }\n});" "Class" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/class" nil nil)
                       ("author" "/**\n * Author: Johan Andersson (johan.rejeep@gmail.com) \n * Created: `(format-time-string \"%Y-%m-%d\")`\n * \n * $0\n */" "Author" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/author" nil nil)
                       ("al" "alert($0);" "alert" nil nil nil "/Users/evans/.spacemacs.d/snippets/js-mode/al" nil nil)))


;;; Do not edit! File generated at Sun Dec 25 22:07:25 2016
