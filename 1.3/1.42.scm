
(define (square x) (* x x))
;Value: square

(define (inc x) (+ x 1))
;Value: inc

(square 5)
;Value: 25

(inc 8)
;Value: 9

(define (compose f g)
  (lambda (x) (f (g x))))
;Value: compose

((compose square inc) 6)
;Value: 49

