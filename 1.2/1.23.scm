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


Another run of the algorithm:


(define (search-for-primes n1 n2)
  (if (odd? n1)
      (timed-prime-test n1))
  (if (< n1 n2)
      (search-for-primes (+ n1 1) n2)))
;Value: search-for-primes


(define (next x)
  (if (= x 2)
      3
      (+ x 2)))
;Value: next

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))
;Value: find-divisor




(search-for-primes 1000000000 1000000035)

1000000007 *** .03100000000000591
1000000009 *** .03200000000001069
1000000021 *** .03200000000001069
1000000033 *** .04599999999999227
1000000035
;Unspecified return value



1000000007 *** .0619999999999834
1000000009 *** .0630000000000166
1000000021 *** .06299999999998818
1000000033 *** .06200000000001182
;Unspecified return value



(search-for-primes 10000000000 10000000090)

10000000019 *** .125
10000000033 *** .10900000000000887
10000000061 *** .125
10000000069 *** .125
10000000089
;Unspecified return value


10000000019 *** .20400000000000773
10000000033 *** .23499999999998522
10000000061 *** .20300000000000296
10000000069 *** .20300000000000296
;Unspecified return value


(search-for-primes 100000000000 100000000070)

100000000003 *** .39099999999999113
100000000019 *** .375
100000000057 *** .38999999999998636
100000000063 *** .375
100000000069 *** .38900000000001

;Unspecified return value



100000000003 *** .6409999999999911
100000000019 *** .625
100000000057 *** .6410000000000196
100000000063 *** .6399999999999864
100000000069 *** .6260000000000048
;Unspecified return value


(search-for-primes 1000000000000 1000000000100)

1000000000039 *** 1.203000000000003
1000000000061 *** 1.218999999999994
1000000000063 *** 1.1880000000000166
1000000000091 *** 1.186000000000007
1000000000099
;Unspecified return value


1000000000039 *** 2.0010000000000048
1000000000061 *** 2.031000000000006
1000000000063 *** 2.015000000000015
1000000000091 *** 2.048000000000002
;Unspecified return value


(search-for-primes 10000000000000 10000000000140)

10000000000037 *** 3.812000000000012
10000000000051 *** 3.796999999999997
10000000000099 *** 3.812999999999988
10000000000129 *** 3.798000000000002
10000000000139
;Unspecified return value


10000000000037 *** 6.409999999999997
10000000000051 *** 6.671999999999997
10000000000099 *** 6.376000000000005
10000000000129 *** 6.390000000000015
;Unspecified return value


The observed ratio is approximately 1.6 and not 2. It's because we introduced some overhead when rewrote the code incrementing the test divisor (+ test-divisor 1) with the 'next' procedure.