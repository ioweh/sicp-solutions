
(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
;Value: expmod

(define (fermat-test n a)
  (= (expmod a n n) a))
;Value: fermat-test

(define (test-primes n)
  (test-prime n (- n 1)))
;Value: test-primes


(define (test-prime n a)
  (cond ((= a 1) true)
	((fermat-test n a) (test-prime n (- a 1)))
	(else false)))
;Value: test-prime


(test-primes 561)
;Value: #t

(test-primes 1105)
;Value: #t

(test-primes 1729)
;Value: #t

(test-primes 2465)
;Value: #t

(test-primes 2821)
;Value: #t

(test-primes 6601)
;Value: #t



(define (smallest-divisor n)
  (find-divisor n 2))
;Value: smallest-divisor

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
;Value: find-divisor

(define (divides? a b)
  (= (remainder b a) 0))
;Value: divides?

(define (prime? n)
  (= n (smallest-divisor n)))
;Value: prime?

(prime? 561)
;Value: #f

(smallest-divisor 561)
;Value: 3

(/ 561 3)
;Value: 187

(prime? 1105)
;Value: #f

(prime? 1729)
;Value: #f

(prime? 2465)
;Value: #f

(prime? 2821)
;Value: #f

(prime? 6601)
;Value: #f

