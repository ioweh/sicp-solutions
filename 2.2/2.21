
(define (square-list items)
  (if (null? items)
      ()
      (cons (square (car items))
	    (square-list (cdr items)))))
;Value: square-list

(square-list (list 1 2 3 4))
;Value 3: (1 4 9 16)

(define (square-list items)
  (map square
       items))
;Value: square-list

(square-list (list 1 2 3 4))
;Value 4: (1 4 9 16)

