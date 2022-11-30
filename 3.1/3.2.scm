

(define (make-monitored proc)
  (let ((number-of-calls 0))
    (define (dispatch m)
      (cond ((eq? m 'how-many-calls?) number-of-calls)
	    (else (set! number-of-calls (+ number-of-calls 1)) (proc m))))
    dispatch))
;Value: make-monitored

(define s (make-monitored sqrt))
;Value: s

(s 100)
;Value: 10

(s 81)
;Value: 9

(s 3)
;Value: 1.7320508075688772

(s 'how-many-calls?)
;Value: 3

(s 36)
;Value: 6

(s 'how-many-calls?)
;Value: 4

