(define (double x)
  (+ x x))
;value: double

(define (halve x)
  (/ x 2))
;value: halve

(define (* a b)
  (cond ((= b 0) 0)
	((even? b) (* (double a) (halve b)))
	(else (+ a (* a (- b 1))))))
;Value: *

(* 2 3)
;Value: 6

(* 4 5)
;Value: 20

Note: we use an invariant here:

c + a * b = const

Initially, c equals 0. Let's assume that on the first step we encounter an odd number, and the equation above will look like:

a + a * (b - 1) = const

which is, in other terms:

c1 + a1 * b1 = const

On the last step, the final version will look like the following (as 1 is odd):

cn + 0 = const

And the answer will be readily produced by cn.

***

To correct some of the previous errors, here's an updated version of an iterative algorithm:

(define (fast-mul-iter-step a b k)
  (cond ((= b 0) k)
	((odd? b) (fast-mul-iter-step a (- b 1) (+ a k)))
	(else (fast-mul-iter-step (* 2 a) (/ b 2) k))))

