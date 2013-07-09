
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

(define i (make-interval 2 3))
;Value: i

(car i)
;Value: 2

(cdr i)
;Value: 3

(define (upper-bound i) (cdr i))
;Value: upper-bound

(define (lower-bound i) (car i))
;Value: lower-bound

(define a (make-interval 5 10))
;Value: a

(define b (make-interval 10 20))
;Value: b

(add-interval a b)
;Value 3: (15 . 30)

(mul-interval a b)
;Value 4: (50 . 200)

(div-interval a b)
;Value 5: (.25 . 1.)

