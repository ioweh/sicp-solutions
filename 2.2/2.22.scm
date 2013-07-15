
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
  (iter items ()))
;Value: square-list

(square-list (list 1 2 3 4))
;Value 3: (16 9 4 1)

Because Louis traverses list in the wrong direction. The first element of the list will be the last one.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer
		    (square (car things))))))
  (iter items ()))
;Value: square-list

(square-list (list 1 2 3 4))
;Value 4: ((((() . 1) . 4) . 9) . 16)

Now Louis builds a list of nested cons-es. Same with me working on the exercise 2.18.