
(define (compose f g)
  (lambda (y) (f (g y))))
;Value: compose

(define (inc x) (+ x 1))
;Value: inc

(define (repeated func n)
  (define (iter i)
    (if (< i n)
	(compose func (iter (+ i 1)))
	(lambda (x) (func x))))
  (iter 1))
;Value: repeated

((repeated square 2) 5)
;Value: 625

(define (average-damp f)
  (lambda (x) (average x (f x))))
;Value: average-damp

(define (average x y)
  (/ (+ x y) 2))
;Value: average

((average-damp square) 10)
;Value: 55

(define tolerance 0.00001)
;Value: tolerance

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))
;Value: fixed-point

(fixed-point cos 1.0)
;Value: .7390822985224024

(define (cube x) (* x x x))
;Value: cube


(define (nth-root x n)
  (fixed-point ((repeated average-damp (log2 n)) (lambda (y) (/ x (exponent y (- n 1)))))
	       1.0))
;Value: nth-root


(nth-root 16 68)
;Value: 1.0416241748371353


(define (exponent x n)
  (define (iter i)
    (if (< i n)
	(* x (iter (+ i 1)))
	x))
  (iter 1))
;Value: exponent


(for square root 1 average-damp)
(for 4th root 2 average-damps)
(for 8th root 3 average-damps)
(for 16th root 4 average-damps)

the amount of average-damps grows logarithmically with the nth square root.

log
;Value 5: #[compiled-procedure 5 ("arith" #xcc) #x3 #x35b10]

Use the change of base formula to compute the logarithm of n with respect to the base 2

(define (log2 x)
  (/ (log x) (log 2)))
;Value: log2


***

Note: we also need to use the floor function for the algorithm to run correctly. Here's how to come to an improved solution:


First, we need to define exponentiation. Let's do it via the already defined repeated procedure.


(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x) (f ((repeated f (- n 1)) x)))))
;Value: repeated


(define (power y n)
  (cond ((= n 0) 1)
	((= n 1) y)
	(else ((repeated (lambda (x) (* x y)) (- n 1)) y))))
;Value: power


After defining the power procedure, let's implement the procedure computing roots with an arbitrary parameter specifying how many times average damping should be repeated.


(define (nth-root x n avg-damp-times)
  (fixed-point ((repeated average-damp avg-damp-times) (lambda (y) (/ x (power y (- n 1)))))
	       1.0))
;Value: nth-root


Then let's try to guess the number of times we need to run the procedure.


(nth-root 2 4 1)
;Quit!

(nth-root 2 8 2)
;Quit!

(nth-root 2 16 3)
;Quit!

(nth-root 2 32 4)
;Quit!

(nth-root 2 64 5)
;Quit!

(nth-root 2 128 6)
;Quit!


The clear pattern can be seen here. The number of average damps grows logarithmically with the root n.

Now let's define the logarithm with the base 2.


(define (log2 a)
  (/ (log a) (log 2)))
;Value: log2


As the numbers can be non-integer, we'll need to use the floor function in the final implementation of the nth root:


(define (nth-root-fixed x n)
  (fixed-point ((repeated average-damp (floor (log2 n))) (lambda (y) (/ x (power y (- n 1)))))
	       1.0))
;Value: nth-root-fixed

