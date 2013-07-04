
(define (compose f g)
  (lambda (y) (f (g y))))
;Value: compose

(define (inc x) (+ x 1))
;Value: inc

((compose square inc) 6)
;Value: 49

((compose inc square) 6)
;Value: 37

(define (repeated func n)
  (define (iter i)
    (if (< i n)
	(compose func (iter (+ i 1)))
	(lambda (x) (func x))))
  (iter 1))
;Value: repeated

((repeated square 2) 5)
;Value: 625


((repeated inc 16) 5)
;Value: 21


