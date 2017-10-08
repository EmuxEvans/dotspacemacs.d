;;; Compiled snippets and support files for `js2-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js2-mode
                     '(("sh.snippet" "require('should');\n" "sh.snippet" nil nil nil "/Users/evans/.spacemacs.d/snippets/js2-mode/sh.snippet" nil nil)
                       ("lwf" "console.log('${1:`(my-which-function)`} called');" "console.log which function called" nil nil nil "/Users/evans/.spacemacs.d/snippets/js2-mode/log-which-func" "direct-keybinding" nil)
                       ("its.snippet" "it(\"${1:should do awesome things}\", sinon.test(function(${2:done}) {\n  ${3:// code}\n}))\n" "its.snippet" nil nil nil "/Users/evans/.spacemacs.d/snippets/js2-mode/its.snippet" nil nil)
                       ("it.snippet" "it(\"${1:should do awesome things}\", function(${2:done}) {\n  ${3:// code}\n})\n" "it.snippet" nil nil nil "/Users/evans/.spacemacs.d/snippets/js2-mode/it.snippet" nil nil)
                       ("desc.snippet" "describe('${1:Some Feature}', function() {\n  ${2:// specs}\n})\n" "desc.snippet" nil nil nil "/Users/evans/.spacemacs.d/snippets/js2-mode/desc.snippet" nil nil)
                       ("befea.snippet" "beforeEach (${1:done}, function() {\n  ${2:// code}\n}) \n" "befea.snippet" nil nil nil "/Users/evans/.spacemacs.d/snippets/js2-mode/befea.snippet" nil nil)
                       ("bef.snippet" "before (${1:done}, function() {\n  ${2:// code}\n}) \n" "bef.snippet" nil nil nil "/Users/evans/.spacemacs.d/snippets/js2-mode/bef.snippet" nil nil)
                       ("afea.snippet" "afterEach (${1:done}, function() {\n  ${2: // code}\n})\n" "afea.snippet" nil nil nil "/Users/evans/.spacemacs.d/snippets/js2-mode/afea.snippet" nil nil)
                       ("af.snippet" "after (${1:done}, function() {\n  ${2:// code}\n})\n" "af.snippet" nil nil nil "/Users/evans/.spacemacs.d/snippets/js2-mode/af.snippet" nil nil)))


;;; Do not edit! File generated at Sun Dec 25 22:07:25 2016
