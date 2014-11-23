1)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) (* guess 0.001)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

2)

(load "newton-raphson.scm")
;Loading "newton-raphson.scm"... done
;Value: sqrt

(sqrt 2)
;Value: 1.4142156862745097

(define (sqrt x)
  (sqrt-iter 1.0 (improve 1.0 x) x))
;Value: sqrt

(define (sqrt-iter guess newguess x)
  (if (good-enough? guess newguess x)
      guess
      (sqrt-iter newguess
		 (improve newguess x)
		 x)))
;Value: sqrt-iter

(define (good-enough? guess newguess x)
  (< (/ (abs (- guess newguess)) guess) 0.001))

(sqrt 2)
;Value: 1.4142156862745097