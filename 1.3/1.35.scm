
As shown in section 1.2.2, the golden ratio satisfies the equation

phi^2 = phi + 1

let's divide both sides of the equation by phi:

phi = 1 + 1/phi

Now we can use this fact to compute phi by means of the fixed-point procedure.

(define tolerance 0.00001)
;Value: tolerance

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))
;Value: fixed-point

(fixed-point (lambda (x) (+ 1 (/ 1 x)))
	     1.0)
;Value: 1.6180327868852458


