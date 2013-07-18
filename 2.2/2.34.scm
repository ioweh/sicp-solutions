
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(accumulate + 0 (list 1 2 3 4 5))
;Value: 15

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) 
		(+ this-coeff
		   (* x higher-terms)))
	      0
	      coefficient-sequence))
;Value: horner-eval



(horner-eval 2 (list 1 3 0 5 0 1))
;Value: 79


(define x 2)
;Value: x

(+ 1 (* 3 x) (* 5 (* x x x)) (* x x x x x))
;Value: 79




