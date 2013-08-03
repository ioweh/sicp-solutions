
(define (element-of-set? x set)
  (cond ((null? set) false)
	((= x (car set)) true)
	((< x (car set)) false)
	(else (element-of-set? x (cdr set)))))
;Value: element-of-set?

(define (adjoin-set x set)
  (cond ((null? set) '())
	((= x (car set))
	 set)
	((< x (car set)) (cons x set))
	(else (cons (car set) 
		    (adjoin-set x (cdr set))))))
;Value: adjoin-set


(adjoin-set 3 '(1 2 4 5))
;Value 6: (1 2 3 4 5)


; On the average we should expect to have to examine about half of the items in the set.

