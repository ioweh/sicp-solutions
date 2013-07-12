
At first sight, Eva is right. Let's examine it in details.

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))
;Value: par1

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))))
;Value: par2

(define (make-interval a b) (cons a b))
;Value: make-interval

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
;Value: mul-interval

(define (div-interval x y)
  (mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y)))))
;Value: div-interval

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))
;Value: add-interval

(define (upper-bound i) (cdr i))
;Value: upper-bound

(define (lower-bound i) (car i))
;Value: lower-bound

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
;Value: make-center-width

(define (make-center-percent c p)
  (make-center-width c
		     (* c (/ p 100))))
;Value: make-center-percent

(define (percent i)
  (* 100 (/ (width i) (center i))))
;Value: percent

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
;Value: center

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
;Value: width

(define r1 (make-center-percent 6.0 1.0))
;Value: r1

r1
;Value 4: (5.94 . 6.06)

(define r2 (make-center-percent 3.0 1.0))
;Value: r2

r2
;Value 5: (2.97 . 3.03)

(par1 r1 r2)
;Value 6: (1.9407920792079212 . 2.060808080808081)

(par2 r1 r2)
;Value 7: (1.9800000000000002 . 2.02)

Let's consider how many operations are performed in both cases.

(define c1 6.0)
;Value: c1


(define p1 1.0)
;Value: p1


(define c2 3.0)
;Value: c2


(define p2 1.0)
;Value: p2



(par1 r1 r2)
;Value 8: (1.9407920792079212 . 2.060808080808081)

(par1 (make-center-percent c1 p1) (make-center-percent c2 p2))
;Value 10: (1.9407920792079212 . 2.060808080808081)

(par1 (make-center-width c1 (* c1 (/ p1 100)))
      (make-center-width c2 (* c2 (/ p2 100))))
;Value 11: (1.9407920792079212 . 2.060808080808081)

(par1 (make-interval (- c1 (* c1 (/ p1 100)))
		     (+ c1 (* c1 (/ p1 100))))
      (make-interval (- c2 (* c2 (/ p2 100)))
		     (+ c2 (* c2 (/ p2 100)))))
;Value 13: (1.9407920792079212 . 2.060808080808081)

(div-interval (mul-interval (make-interval (- c1 (* c1 (/ p1 100)))
					   (+ c1 (* c1 (/ p1 100))))
			    (make-interval (- c2 (* c2 (/ p2 100)))
					   (+ c2 (* c2 (/ p2 100)))))
	      (add-interval (make-interval (- c1 (* c1 (/ p1 100)))
					   (+ c1 (* c1 (/ p1 100))))
			    (make-interval (- c2 (* c2 (/ p2 100)))
					   (+ c2 (* c2 (/ p2 100))))))
;Value 14: (1.9407920792079212 . 2.060808080808081)

(mul-interval (mul-interval (make-interval (- c1 (* c1 (/ p1 100)))
					   (+ c1 (* c1 (/ p1 100))))
			    (make-interval (- c2 (* c2 (/ p2 100)))
					   (+ c2 (* c2 (/ p2 100)))))
	      (make-interval (/ 1.0 (upper-bound (add-interval (make-interval (- c1 (* c1 (/ p1 100)))
									      (+ c1 (* c1 (/ p1 100))))
							       (make-interval (- c2 (* c2 (/ p2 100)))
									      (+ c2 (* c2 (/ p2 100)))))))
			     (/ 1.0 (lower-bound (add-interval (make-interval (- c1 (* c1 (/ p1 100)))
									      (+ c1 (* c1 (/ p1 100))))
							       (make-interval (- c2 (* c2 (/ p2 100)))
									      (+ c2 (* c2 (/ p2 100)))))))))
;Value 15: (1.9407920792079212 . 2.060808080808081)

From the exercise 2.13 we know that when we multiply two intervals, the tolerance is: tolerance(xy) = tolerance(x) + (tolerance y)

(It's necessary to assume that we talk about the intervals that have small percentage tolerances)

In this case two multiplication operations are required.

Now go on to the second case.

(par2 r1 r2)
;Value 16: (1.9800000000000002 . 2.02)

As we can see, comparing with the previous case, this case is more precise.

(let ((one (make-interval 1 1)))
  (div-interval one
		(add-interval (div-interval one r1)
			      (div-interval one r2))))
;Value 17: (1.9800000000000002 . 2.02)

(let ((one (make-interval 1 1)))
  (div-interval one
		(add-interval (mul-interval one
					    (make-interval (/ 1.0 (upper-bound r1))
							   (/ 1.0 (lower-bound r1))))
			      (mul-interval one
					    (make-interval (/ 1.0 (upper-bound r2))
							   (/ 1.0 (lower-bound r2)))))))
;Value 18: (1.9800000000000002 . 2.02)

(define one (make-interval 1 1))
;Value: one


(mul-interval one
	      (make-interval (/ 1.0 (upper-bound (add-interval (mul-interval one
									     (make-interval (/ 1.0 (upper-bound r1))
											    (/ 1.0 (lower-bound r1))))
							       (mul-interval one
									     (make-interval (/ 1.0 (upper-bound r2))
											    (/ 1.0 (lower-bound r2)))))))
			     (/ 1.0 (lower-bound (add-interval (mul-interval one
									     (make-interval (/ 1.0 (upper-bound r1))
											    (/ 1.0 (lower-bound r1))))
							       (mul-interval one
									     (make-interval (/ 1.0 (upper-bound r2))
											    (/ 1.0 (lower-bound r2)))))))))
;Value 19: (1.9800000000000002 . 2.02)

The tolerance of one is zero. When we multiply an interval by one, the tolerance doesn't increase. (tol(x*1) = (tol x) + (tol 1) = (tol x))
Then, the error doesn't increase too. That's why we get good results in the second case.






