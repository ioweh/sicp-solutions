
(define (accumulate combiner filter null-value term a next b)
  (cond ((> a b) null-value)
	((filter a)
	 (combiner (term a)
		   (accumulate combiner filter null-value term (next a) next b)))
	(else
	 (accumulate combiner filter null-value term (next a) next b))))
;Value: accumulate

(define (sum-of-even min max)
  (define (identity a) a)
  (define (inc a) (+ a 1))
  (accumulate + even? 0 identity min inc max))
;Value: sum-of-even

(sum-of-even 1 5)
;Value: 6

(sum-of-even 1 7)
;Value: 12

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

(define (prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (prime? n (- times 1)))
	(else false)))
;Value: prime?

(define (isprime? n)
  (prime? n 10))
;Value: isprime?


(define (sum-prime-squares a b)
  (define (inc a) (+ a 1))
  (accumulate + isprime? 0 square a inc b))
;Value: sum-prime-squares

(sum-prime-squares 2 5)
;Value: 38

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
;Value: gcd



(define (product-of-coprime n)
  (define (identity a) a)
  (define (inc a) (+ a 1))
  (define (coprime? a)
    (= (gcd a n) 1))
  (accumulate * coprime? 1 identity 1 inc n))
;Value: product-of-coprime

(product-of-coprime 5)
;Value: 24

(product-of-coprime 6)
;Value: 5
















