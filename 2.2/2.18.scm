


(define (reverse items)
  (define (reverse-list a b)
    (if (null? (cdr a))
	(cons (car a) b)
	(reverse-list (cdr a) (cons (car a) b))))
  (reverse-list items ()))
;Value: reverse



(reverse (list 1 4 9 16 25))
;Value 18: (25 16 9 4 1)




