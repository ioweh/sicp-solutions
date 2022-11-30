

(define (make-accumulator value)
  (define (increase-by amount)
    (set! value (+ value amount))
    value)
  increase-by)
;Value: make-accumulator

(define A (make-accumulator 5))
;Value: a

(a 10)
;Value: 15

(a 10)
;Value: 25

(a 10)
;Value: 35

(a 30)
;Value: 65





