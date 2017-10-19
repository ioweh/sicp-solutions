


(define (reverse items)
  (define (reverse-list a b)
    (if (null? (cdr a))
	(cons (car a) b)
	(reverse-list (cdr a) (cons (car a) b))))
  (reverse-list items ()))
;Value: reverse



(reverse (list 1 4 9 16 25))
;Value 18: (25 16 9 4 1)


***


(define (reverse items)
  (define (reverse-iter items reversed-items)
    (if (null? items)
	reversed-items
	(reverse-iter (cdr items) (cons (car items) reversed-items))))
  (reverse-iter items ()))
;Value: reverse


(reverse (list 1 4 9 16 25))
;Value 18: (25 16 9 4 1)
