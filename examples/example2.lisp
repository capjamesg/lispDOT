(defun examplegraph ()
    ;; an example graph called "example" with five nodes and four connections
    (makegraph
        "graph"
        "example" 
        (l
            (udc (l "Choose a graph object type" "Undirected"))
            (udc (l "Choose a graph object type" "Directed"))
            (udc (l "Directed" "Declare a graph using (makegraph 'graph' 'graphname') and use (dc) for each graph node."))
            (udc (l "Undirected" "Declare a graph using (makegraph 'digraph' 'graphname') and use (udc) for each graph node."))
            (udc () (l (attrib "color" "green" "Directed")))
            (udc () (l (attrib "color" "blue" "Undirected"))))
        (meta "size" "5,5")))
        
(princ (examplegraph))