(define (square-check x m)
  (if (and (not (or (= x 1) (= x (- m 1))))(= (remainder (- (square x) 1) m) 0))
      0
      (square x)))
;Value: square-check

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square-check (expmod base (/ exp 2) m) m)
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
;Value: expmod


(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 2 (random-integer (- n 2)))))
;Value: miller-rabin-test


(miller-rabin-test 5)
;Value: #t

(miller-rabin-test 4)
;Value: #f

(miller-rabin-test 13)
;Value: #t

