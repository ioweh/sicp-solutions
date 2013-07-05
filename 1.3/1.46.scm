
(define (iterative-improve good-enough? improve)
  (define (iter-imp guess)
    (if (good-enough? guess)
	guess
	(iter-imp (improve guess))))
  iter-imp)
;Value: iterative-improve

(define (sqrt x)
  ((iterative-improve (lambda (guess)
			(< (abs (- (square guess) x))
			   0.001))
		      (lambda (guess)
			(average guess (/ x guess))))
   1.0))
;Value: sqrt

(define (average a b)
  (/ (+ a b) 2))
;Value: average


(sqrt 4)
;Value: 2.0000000929222947

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (guess)
			(< (abs (- (f guess) guess))
			   0.00001))
		      f)
   first-guess))
;Value: fixed-point

(fixed-point cos 1.0)
;Value: .7390893414033927

