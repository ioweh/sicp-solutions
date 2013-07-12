
Lem complains that Alyssa's program gives different answers for the two ways of computing.

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

Let's check it out.

(define (make-interval a b) (cons a b))
;Value: make-interval

(define (add-interval i1 i2)
  (make-interval (+ (lower-bound i1) (lower-bound i2))
		 (+ (upper-bound i1) (upper-bound i2))))
;Value: add-interval

(define (lower-bound i)
  (car i))
;Value: lower-bound

(define (upper-bound i)
  (cdr i))
;Value: upper-bound

(define (mul-interval i1 i2)
  (let ((p1 (* (lower-bound i1) (lower-bound i2)))
	(p2 (* (lower-bound i1) (upper-bound i2)))
	(p3 (* (upper-bound i1) (upper-bound i2)))
	(p4 (* (upper-bound i1) (upper-bound i2))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
;Value: mul-interval

(define (div-interval i1 i2)
  (mul-interval i1
		(make-interval (/ 1 (upper-bound i2))
			       (/ 1 (lower-bound i2)))))
;Value: div-interval

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
;Value: make-center-width

(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.0))))
;Value: make-center-percent


(define r1 (make-center-percent 6.8 10))
;Value: r1

(define r2 (make-center-percent 7.9 5))
;Value: r2

r1
;Value 4: (6.12 . 7.4799999999999995)

r2
;Value 5: (7.505000000000001 . 8.295)

(par1 r1 r2)
;Value 6: (2.9116069730586376 . 4.5538788990825685)

(par2 r1 r2)
;Value 7: (3.3710532110091744 . 3.9332234548335974)


The two procedures (which are equivalent) show different results. Something went wrong...

(define (percent i)
  (* 100 (/ (width i) (center i))))
;Value: percent

(define (center i)
  (/ (+ (upper-bound i) (lower-bound i)) 2.0))
;Value: center

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2.0))
;Value: width


(percent r1)
;Value: 9.999999999999996

(percent r2)
;Value: 4.999999999999994

Let's define two intervals whose width is a small percentage of the center value.

(define a (make-center-percent 6 .01))
;Value: a


a
;Value 16: (5.9994 . 6.0006)


(define b (make-center-percent 3 .01))
;Value: b


b
;Value 17: (2.9997 . 3.0003)


(div-interval a a)
;Value 18: (.9998000199980002 . 1.0002000200020003)


(div-interval a b)
;Value 19: (1.9996000399960003 . 2.0004000400040005)



The bigger the difference between the upper and lower bound is, the more inaccurate results are.

(define a (make-center-percent 6 10))
;Value: a

(div-interval a a)
;Value 23: (.8181818181818182 . 1.222222222222222)

(define a (make-center-percent 6 0.01))
;Value: a

(define c 6)
;Value: c

(define p 0.0001)
;Value: p



(div-interval (make-center-percent c p)
	      (make-center-percent c p))
;Value 34: (.999998000002 . 1.000002000002)


(div-interval (make-center-width c
				 (* c (/ p 100)))
	      (make-center-width c
				 (* c (/ p 100))))
;Value 35: (.999998000002 . 1.000002000002)


(div-interval (make-interval (- c (* c (/ p 100)))
			     (+ c (* c (/ p 100))))
	      (make-interval (- c (* c (/ p 100)))
			     (+ c (* c (/ p 100)))))
;Value 36: (.999998000002 . 1.000002000002)


(mul-interval (make-interval (- c (* c (/ p 100)))
			     (+ c (* c (/ p 100))))
	      (make-interval (/ 1.0 (+ c (* c (/ p 100))))
			     (/ 1.0 (- c (* c (/ p 100))))))
;Value 37: (.999998000002 . 1.000002000002)


(let ((p1 (* (- c (* c (/ p 100))) (/ 1.0 (+ c (* c (/ p 100))))))
      (p2 (* (- c (* c (/ p 100))) (/ 1.0 (- c (* c (/ p 100))))))
      (p3 (* (+ c (* c (/ p 100))) (/ 1.0 (+ c (* c (/ p 100))))))
      (p4 (* (+ c (* c (/ p 100))) (/ 1.0 (- c (* c (/ p 100)))))))
  (make-interval (min p1 p2 p3 p4)
		 (max p1 p2 p3 p4)))
;Value 38: (.999998000002 . 1.000002000002)








