
(define (same-parity int . int-list)
  (define check?
    (if (odd? int)
	(lambda (x) (odd? x))
	(lambda (x) (even? x))))
  (define (build-list int-list)
    (cond ((null? int-list)
	   ())
	  ((check? (car int-list))
	   (cons (car int-list)
		 (build-list (cdr int-list))))
	  (else (build-list (cdr int-list)))))
  (cons int
	(build-list int-list)))
;Value: same-parity



(same-parity 1 2 3 4 5 6 7)
;Value 18: (1 3 5 7)


(same-parity 2 3 4 5 6 7)
;Value 19: (2 4 6)


***

(define (same-parity . args)
  (define (same-parity-iter first-arg args)
    (cond ((null? args) ())
	  ((equal? (even? first-arg) (even? (car args)))
	   (cons (car args) (same-parity-iter first-arg (cdr args))))
	  (true (same-parity-iter first-arg (cdr args)))))
  (same-parity-iter (car args) args))
;Value: same-parity

