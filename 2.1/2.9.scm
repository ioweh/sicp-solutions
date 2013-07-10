
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))
;Value: add-interval

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

(define (make-interval a b) (cons a b))
;Value: make-interval

(define (upper-bound a) (cdr a))
;Value: upper-bound

(define (lower-bound a) (car a))
;Value: lower-bound

(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
		 (- (upper-bound a) (lower-bound b))))
;Value: sub-interval

(define x (make-interval 15 20))
;Value: x

(define y (make-interval 30 40))
;Value: y

(define (width i)
  (/ (abs (- (upper-bound i) (lower-bound i))) 2))
;Value: width


(* 1.0 (width x))
;Value: 2.5



(define sum-xy (add-interval x y))
;Value: sum-xy

sum-xy
;Value 3: (45 . 60)


(* 1.0 (width sum-xy))
;Value: 7.5


(* 1.0 (width y))
;Value: 5.



We can clearly see that the width of the sum of intervals is sum of the widths of intervals. Let's illustrate it again

(width (add-interval x y))

(width (make-interval (+ (lower-bound x) (lower-bound y))
		      (+ (upper-bound x) (upper-bound y))))

Lower bound of the interval consisting of two points: (+ (lower-bound x) (lower-bound y)), (+ (upper-bound x) (upper-bound y))

is (+ (lower-bound x) (lower-bound y))

Upper bound is (+ (upper-bound x) (upper-bound y))

Remembering the definition of width, it's easy to come to conslusion:

(define (width i)
  (/ (abs (- (upper-bound i) (lower-bound i))) 2))

(/ (abs (- (+ (upper-bound x) (upper-bound y)) (+ (lower-bound x) (lower-bound y)))) 2)

(/ (abs (+ (- (upper-bound x) (lower-bound x)) (- (upper-bound y) (lower-bound y)))) 2)

(/ (abs (+ (* 2 (width x)) (* 2 (width y)))) 2)

(abs (+ (width x) (width y)))

(+ (width x) (width y))


(width (sub-interval x y))

(width (make-interval (- (lower-bound x) (upper-bound y))
		      (- (upper-bound x) (lower-bound y))))

(/ (abs (- (- (lower-bound x) (upper-bound y))
	   (- (upper-bound x) (lower-bound y)))) 2)

(/ (abs (- (- (lower-bound x) (upper-bound x))
	   (- (upper-bound y) (lower-bound y)))) 2)

(/ (abs (- (- (* 2 (width x)))
	   (* 2 (width y)))) 2)

(+ (width x) (width y))







Let's use the same logic for multiplication.

(width (mul-interval x y))

(width (let ((p1 (* (lower-bound x) (lower-bound y)))
	     (p2 (* (lower-bound x) (upper-bound y)))
	     (p3 (* (upper-bound x) (lower-bound y)))
	     (p4 (* (upper-bound x) (upper-bound y))))
	 (make-interval (min p1 p2 p3 p4)
			(max p1 p2 p3 p4))))


(* (width x) (width y))

(* (/ (abs (- (upper-bound x) (lower-bound x))) 2)
   (/ (abs (- (upper-bound y) (lower-bound y))) 2))

Since now we have more options, we cannot be certain if the multiplication of sums can be the same as the sum of multiplication.

Let's pretend that we have only two options, the same as with sum. 

Lower bound: (* (lower-bound x) (lower-bound y))
Upper bound: (* (upper-bound x) (upper-bound y))

(/ (- (* (upper-bound x) (upper-bound y))
      (* (lower-bound x) (lower-bound y))) 2)



