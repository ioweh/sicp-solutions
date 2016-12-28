(define (double x) (+ x x))
;Value: double

(double 5)
;Value: 10

(define (halve x) (/ x 2))
;Value: halve

(halve 6)
;Value: 3

(halve 5)
;Value: 5/2

(define (halve2 n)
  (halve-iter 1 1 1 n))
;Value: halve2

(define (halve-iter guess old-guess the-oldest-guess n)
  (cond ((= guess n) old-guess)
	((> guess n) (+ the-oldest-guess (halve-iter 1 1 1 (- n old-guess))))
	(else (halve-iter (double guess) guess old-guess n))))
;Value: halve-iter



(halve2 4)
;Value: 2

(halve2 8)
;Value: 4

(halve2 6)
;Value: 3

(halve 16)
;Value: 8

(halve 12)
;Value: 6

(halve 22)
;Value: 11

