
(define (reverse sequence)
  (fold-right (lambda (x y)
		(append y (list x)))
	      ()
	      sequence))
;Value: reverse


(reverse (list 1 2 3 4))
;Value 11: (4 3 2 1)


(define (reverse sequence)
  (fold-left (lambda (x y)
	       (cons y x))
	     ()
	     sequence))
;Value: reverse

(reverse (list 1 2 3 4))
;Value 10: (4 3 2 1)

