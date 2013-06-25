(define (next input)
  (if (= input 2)
      3
      (+ input 2)))
;Value: next

(define (smallest-divisor n)
  (find-divisor n 2))
;Value: smallest-divisor

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))
;Value: find-divisor

(define (divides? a b)
  (= (remainder b a) 0))
;Value: divides?

(define (prime? n)
  (= n (smallest-divisor n)))
;Value: prime?

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
;Value: timed-prime-test

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
;Value: start-prime-test

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
;Value: report-prime

(timed-prime-test 1000000009)

1000000009 *** .05000000000000071
;Unspecified return value

(timed-prime-test 1000000021)

1000000021 *** .05999999999999872
;Unspecified return value

(timed-prime-test 1000000033)

1000000033 *** .05000000000000071
;Unspecified return value



(timed-prime-test 10000000033)

10000000033 *** .1700000000000017
;Unspecified return value

(timed-prime-test 10000000069)

10000000069 *** .17999999999999972
;Unspecified return value

(timed-prime-test 10000000141)

10000000141 *** .1700000000000017
;Unspecified return value



(timed-prime-test 100000000003)

100000000003 *** .5700000000000003
;Unspecified return value

(timed-prime-test 100000000057)

100000000057 *** .5700000000000003
;Unspecified return value

(timed-prime-test 100000000063)

100000000063 *** .5599999999999987
;Unspecified return value



(timed-prime-test 1000000000039)

1000000000039 *** 1.7700000000000031
;Unspecified return value

(timed-prime-test 1000000000063)

1000000000063 *** 1.7700000000000031
;Unspecified return value

(timed-prime-test 1000000000177)

1000000000177 *** 1.8000000000000043
;Unspecified return value



(timed-prime-test 10000000000051)

10000000000051 *** 5.589999999999996
;Unspecified return value

(timed-prime-test 10000000000099)

10000000000099 *** 5.619999999999997
;Unspecified return value

(timed-prime-test 10000000000129)

10000000000129 *** 5.619999999999997
;Unspecified return value

