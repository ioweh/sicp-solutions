
(define (reverse items)
  (define (step-down old-list new-list)
    (if (null? old-list)
	new-list
	(step-down (cdr old-list)
		   (cons (car old-list)
			 new-list))))
  (step-down items ()))
;Value: reverse

(define x (list (list 1 2) (list 3 4)))
;Value: x

x
;Value 3: ((1 2) (3 4))

(reverse x)
;Value 4: ((3 4) (1 2))

The (car old-list) might be a list too, so we need to modify our procedure appropriately. 

(define (deep-reverse items)
  (define (step-down old-list new-list)
    (cond ((null? old-list) new-list)
	  ((not (pair? old-list)) old-list)
	  (else (step-down (cdr old-list)
			   (cons (step-down (car old-list) ())
				 new-list)))))
  (step-down items ()))
;Value: deep-reverse

(deep-reverse x)
;Value 5: ((4 3) (2 1))


***

(define (deep-reverse items)
  (define (deep-reverse-iter reversed-items items)
    (cond ((null? items) reversed-items)
 	  ((not (pair? items)) items)
	  (true (deep-reverse-iter (cons (deep-reverse (car items)) reversed-items)
				   (cdr items)))))
  (deep-reverse-iter () items))
;Value: deep-reverse

