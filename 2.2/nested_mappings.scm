


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


(define (prime? n)
  (fast-prime? n 13))
;Value: prime?

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ 1 low) high))))
;Value: enumerate-interval

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(accumulate + 0 (list 1 2 3 4 5))
;Value: 15


(accumulate cons
	    ()
	    (map (lambda (i)
		   (map (lambda (j) (list i j))
			(enumerate-interval 1 (- i 1))))
		 (enumerate-interval 1 6)))

;Value 8: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4) (6 1) (6 2) (6 3) (6 4) (6 5))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))
;Value: flatmap

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
;Value: prime-sum?

(prime-sum? (list 3 4))
;Value: #t

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
;Value: make-pair-sum

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
	       (flatmap
		(lambda (i)
		  (map (lambda (j) (list i j))
		       (enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 n)))))
;Value: prime-sum-pairs


(prime-sum-pairs 6)
;Value 34: ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))


(define (permutations s)
  (if (null? s)
      (list ())
      (flatmap (lambda (x)
		 (map (lambda (p) (cons x p))
		      (permutations (remove x s))))
	       s)))
;Value: permutations

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
	  sequence))
;Value: remove

(permutations (list 1 2 3))
;Value 12: ((1 2 3) (1 3 2) (2 1 3) (2 3 1) (3 1 2) (3 2 1))

(permutations (list 2 3))
;Value 35: ((2 3) (3 2))



(map (lambda (p) (cons 1 p))
     (list (list 2 3) (list 3 2)))
;Value 44: ((1 2 3) (1 3 2))


(permutations (list 3))
;Value 48: ((3))

(accumulate append
	    ()
	    (map (lambda (x)
		   (map (lambda (p) (cons x p))
			(permutations ())))
		 (list 3)))
;Value 56: ((3))

(accumulate append
	    ()
	    (map (lambda (x)
		   (map (lambda (p) (cons 3 p))
			(list ())))
		 (list 3)))
;Value 60: ((3))


(accumulate append
	    ()
	    (map (lambda (x)
		   (cons (cons 3 ()) ()))
		 (list 3)))
;Value 61: ((3))

(accumulate append
	    ()
	    (cons (cons (cons 3 ()) ()) ()))
;Value 62: ((3))

(cons (cons (cons 3 ()) ()) ())
;Value 63: (((3)))

(cons (cons 3 ()) ())
;Value 65: ((3))

(append (cons (cons 3 ()) ()) ())
;Value 67: ((3))

(cons (cons 3 ()) ())
;Value 68: ((3))

(permutations (list 3))
;Value 69: ((3))

