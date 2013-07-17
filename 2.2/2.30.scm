
(define (square-tree tree)
  (cond ((null? tree) ())
	((not (pair? tree)) (square tree))
	(else (cons (square-tree (car tree))
		    (square-tree (cdr tree))))))
;Value: square-tree



(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;Value 4: (1 (4 (9 16) 25) (36 49))

(square-tree (list 1 2))
;Value 5: (1 4)

(define (square-tree tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (square-tree sub-tree)
	     (square sub-tree)))
       tree))
;Value: square-tree

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
;Value 6: (1 (4 (9 16) 25) (36 49))

