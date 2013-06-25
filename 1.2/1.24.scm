(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
;Value: expmod

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
;Value: fermat-test

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))
;Value: fast-prime?

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
;Value: timed-prime-test

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))
;Value: start-prime-test

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
;Value: report-prime



; let's take the values from the last example

(timed-prime-test 10000000000051)

10000000000051 *** 0.
;Unspecified return value

(timed-prime-test 4398042316799)

4398042316799 *** 0.
;Unspecified return value

(timed-prime-test 1298074214633706835075030044377087)

1298074214633706835075030044377087 *** .00999999999999801
;Unspecified return value

(timed-prime-test 1363005552434666078217421284621279933627102780881053358473)

1363005552434666078217421284621279933627102780881053358473 *** .00999999999999801
;Unspecified return value

