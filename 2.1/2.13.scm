
Let's remember the definition of an interval

(define (make-interval a b)
  (cons a b))
;Value: make-interval

(define (make-interval-width c w)
  (make-interval (- c w) (+ c w)))
;Value: make-interval-width

(define (make-interval-percent c p)
  (make-interval-width c (* c (/ p 100))))
;Value: make-interval-percent


Let's define two intervals, x and y.


(define px 10)
;Value: px

(define cx 6.4)
;Value: cx

(define x (make-interval-percent cx px))
;Value: x

x
;Value 3: (5.76 . 7.040000000000001)


(define py 5)
;Value: py

(define cy 7.8)
;Value: cy

(define y (make-interval-percent cy py))
;Value: y

y
;Value 4: (7.41 . 8.19)

The lower bound of the interval x is (- cx (* cx (/ px 100)))
The upper bound of the interval x is (+ cx (* cx (/ px 100)))

The lower bound of the interval y is (- cy (* cy (/ py 100)))
The upper bound of the interval y is (+ cy (* cy (/ py 100)))

(define (percent i)
  (* 100 (/ (width i) (center i))))
;Value: percent


(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
;Value: width

(define (center i)
  (/ (+ (upper-bound i) (lower-bound i)) 2))
;Value: center

(define (upper-bound i) (cdr i))
;Value: upper-bound

(define (lower-bound i) (car i))
;Value: lower-bound

(define (mul-interval x y)
  (make-interval (* (lower-bound x) (lower-bound y))
		 (* (upper-bound x) (upper-bound y))))
;Value: mul-interval

(percent (mul-interval x y))
;Value: 14.925373134328362

(percent x)
;Value: 10.000000000000009

(percent y)
;Value: 4.9999999999999964


(percent (mul-interval x y))

(percent (mul-interval (make-interval (- cx (* cx (/ px 100)))
				      (+ cx (* cx (/ px 100))))
		       (make-interval (- cy (* cy (/ py 100)))
				      (+ cy (* cy (/ py 100))))))
;Value: 14.925373134328362

(percent (make-interval (* (- cx (* cx (/ px 100))) (- cy (* cy (/ py 100))))
			(* (+ cx (* cx (/ px 100))) (+ cy (* cy (/ py 100))))))
;Value: 14.925373134328362


(* 100 (/ (width (make-interval (* (- cx (* cx (/ px 100))) (- cy (* cy (/ py 100))))
				(* (+ cx (* cx (/ px 100))) (+ cy (* cy (/ py 100))))))
	  (center (make-interval (* (- cx (* cx (/ px 100))) (- cy (* cy (/ py 100))))
				 (* (+ cx (* cx (/ px 100))) (+ cy (* cy (/ py 100))))))))
;Value: 14.925373134328362


(* 100 (/ (/ (- (* (+ cx (* cx (/ px 100))) (+ cy (* cy (/ py 100))))
		(* (- cx (* cx (/ px 100))) (- cy (* cy (/ py 100))))) 2)
	  (/ (+ (* (+ cx (* cx (/ px 100))) (+ cy (* cy (/ py 100))))
		(* (- cx (* cx (/ px 100))) (- cy (* cy (/ py 100))))) 2)))
;Value: 14.925373134328362

(* 100 (/ (- (+ (* cx cy) 
		(* cx cy (/ py 100))
		(* cx cy (/ px 100))
		(* cx cy (/ px 100) (/ py 100)))
	     (+ (* cx cy)
		(- (* cx cy (/ py 100)))
		(- (* cx cy (/ px 100)))
		(* cx cy (/ px 100) (/ py 100))))
	  (+ (+ (* cx cy)
		(* cx cy (/ py 100))
		(* cx cy (/ px 100))
		(* cx cy (/ px 100) (/ py 100)))
	     (+ (* cx cy)
		(- (* cx cy (/ py 100)))
		(- (* cx cy (/ px 100)))
		(* cx cy (/ px 100) (/ py 100))))))
;Value: 14.925373134328357

(* 100 (/ (+ (* 2 (* cx cy (/ py 100)))
	     (* 2 (* cx cy (/ px 100))))
	  (+ (* 2 (* cx cy))
	     (* 2 (* cx cy (/ px 100) (/ py 100))))))
;Value: 14.92537313432836

(* 100 (/ (+ (* cx cy (/ py 100))
	     (* cx cy (/ px 100)))
	  (+ (* cx cy)
	     (* cx cy (/ (* px py) 10000)))))
;Value: 14.92537313432836


(* 1.0 (/ (+ px py)
	  (+ 1 (/ (* px py) 10000))))
;Value: 14.925373134328359

as the percentage tolerances are small, their sum will grow faster than their product.
Thus the term (/ (* px py) 10000) can be neglected, as it is extinguishly small.

The result is:

(+ px py)
;Value: 15






