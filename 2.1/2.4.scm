
(define (cons x y)
  (lambda (m) (m x y)))
;Value: cons

(define (car z)
  (z (lambda (p q) p)))
;Value: car

(car (cons 2 3))
;Value: 2

(cons x y) |-> (lambda (m) (m x y))

(car (lambda (m) (m 2 3)))
;Value: 2

(car (lambda (m) (m x y)))

((lambda (m) (m 2 3)) (lambda (p q) p))
;Value: 2

((lambda (m) (m x y)) (lambda (p q) p))

((lambda (p q) p) x y)

((lambda (p q) p) 2 3)
;Value: 2

Ultimately, it is x. Then the cdr procedure can be easily defined as:

(define (cdr z)
  (z (lambda (p q) q)))
;Value: cdr

(cdr (cons 2 3))
;Value: 3

