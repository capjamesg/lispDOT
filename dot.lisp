;; implementation of the DOT DSL in Lisp
;; more information about DOT: https://en.wikipedia.org/wiki/DOT_(graph_description_language)

;; attribute reference
;; label - set label
;; shape - set box shape
;; color - set box color
;; style - set line style
;; size - set graph size

(defun cc (&rest items)
    ;; concatenate a list of items
    (apply 'concatenate 'string items))

(defun connection (nodes &optional direction label)
    ;; create a connection between all nodes in a list
    (cc '(#\tab) (string-trim (cc " " direction " ") (apply 'concatenate 'string (loop for item in nodes
        collect (cc "\"" item "\"" " " direction " ")))) (if label (apply 'concatenate 'string label)) "; " '(#\Newline)))

(defun dc (nodes &optional label)
    ;; create a directed connection
    (connection nodes "->" label))

(defun udc (nodes &optional label)
    ;; create an undirected conneciton
    (connection nodes "--" label))

(defun attrib (key value &optional node)
    ;; define an attribute for use at the end of a connection
    (cc (if node (cc (quotify node))) " [" key "=" "\"" value "\"]"))

(defun meta (key value)
    ;; define a meta key=value pair
    (cc '(#\tab) key "=" "\"" value "\";" '(#\Newline)))

(defun l (&rest items) (apply #'list items))

(defun quotify (item)
    ;; surround a term in quotation marks (i.e. coffee becomes "coffee")
    (concatenate 'string "\"" item "\""))

(defun rank (items)
    ;; define a rank=same attribute
    (cc
        '(#\tab)
        " { rank=same; "
        (cc (loop for item in items collect (concatenate 'string (quotify item) " ")))
        " }"
        '(#\Newline)))

(defun makegraph (gtype name nodes &rest rest)
    ;; compose a graph
    (concatenate 'string
        gtype
        " "
        name
        " { "
        '(#\Newline)
        (apply 'concatenate 'string nodes)
        (apply 'concatenate 'string rest)
        "} "
        '(#\Newline)))

;; (load "dot.lisp")