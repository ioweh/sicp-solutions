(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes range)
  (search-for-n-primes range 1))

(define (search-for-n-primes range count)
  (cond ((> count 3) ())
	((prime? range) (timed-prime-test range)
			(search-for-n-primes (+ range 3) (+ count 1)))
	(else (search-for-n-primes (+ range 3) count))))


(search-for-primes 1000000000)

1000000009 *** .09000
1000000021 *** .08999
1000000033 *** .90000


(search-for-primes 10000000000)

10000000033 *** .28999
10000000069 *** .28999
10000000141 *** .28999

(* .9 (sqrt 10))
;Value: .28460


(search-for-primes 100000000000)

100000000003 *** .92000
100000000057 *** .96000
100000000063 *** .90999

(* .28999 (sqrt 10)
;Value: .91702


(search-for-primes 1000000000000)

1000000000039 *** 2.8799
1000000000063 *** 2.8799
1000000000177 *** 2.8900

(* .92 (sqrt 10))
;Value: 2.90929


(search-for-primes 10000000000000)

10000000000051 *** 9.0999
10000000000099 *** 9.0799
10000000000129 *** 9.0900

(* 2.88 (sqrt 10))
;Value: 9.10735