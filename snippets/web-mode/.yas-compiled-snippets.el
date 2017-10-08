;;; Compiled snippets and support files for `web-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'web-mode
                     '(("v-shader" "\n<script type=\"x-shader/x-vertex\" id=\"vertex-shader\">\n  attribute vec4 a_position;\n  $0\n  void main()\n  {\n    gl_Position = a_position;\n  }\n</script>\n" "vertex-shader" nil nil nil "/Users/evans/.spacemacs.d/snippets/web-mode/v-shader" nil nil)
                       ("f-shader" "\n<script type=\"x-shader/x-fragment\" id=\"fragment-shader\">\nvoid main()\n{\n  gl_FragColor = vec4(1,0,0,1);\n}\n</script>\n" "fragment-shader" nil nil nil "/Users/evans/.spacemacs.d/snippets/web-mode/f-shader" nil nil)))


;;; Do not edit! File generated at Sun Dec 25 22:07:26 2016
