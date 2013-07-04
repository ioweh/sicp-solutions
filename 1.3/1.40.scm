
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

(fixed-point cos 1.0)
;Value: .7390822985224024

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
;Value: deriv

(define dx 0.00001)
;Value: dx

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))
;Value: newton-transform

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))
;Value: newtons-method

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
		  1.0))
;Value: sqrt

(sqrt 2)
;Value: 1.4142135623822438

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))
;Value: cubic

(define (square x)
  (* x x))
;Value: square

(define (cube x) (* x x x))
;Value: cube

(newtons-method (cubic 4 3 2) 1)
;Value: -3.2695308420809894

(+ (cube (- 3.27)) (* 4 (square (- 3.27))) (* 3 -3.27) 2)
;Value: -4.183000000002934e-3



