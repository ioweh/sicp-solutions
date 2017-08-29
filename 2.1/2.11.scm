
There are exactly nine possible options when we multiply two intervals together:

(- +) (- +)
(- -) (- +)
(+ +) (- +)
(- +) (- -)
(- -) (- -)
(+ +) (- -)
(- +) (+ +)
(- -) (+ +)
(+ +) (+ +)

We cannot be sure if the absolute value of the lower-bound is lower than the absolute value of the upper-bound in case of the (- +) interval.

However, one can say that when we multiply (- -) (- +) the only negative number will be when we multiply + by -. As it is easy to predict that the
leftmost term in (- -) will have the biggest absolute value, we only need to multiply the leftmost term of the first interval by the positive 
term of the second interval in order to get the biggest negative number. We need to multiply the leftmost term of the first interval by the leftmost
term of the second interval in order to get the biggest positive number. Same logic applies to the rest of the cases, except of the case 
when we multiply (- +) (- +). Let's illustrate this indeterminancy by using the following example. Say, we multiply (- 10 100) (- 100 100)
The biggest negative number is the product of the rightmost term of the first interval and the leftmost term of the second interval. 
Now, consider this case: (- 100 10) (- 100 100). The biggest negative number is the product of the leftmost term of the first interval and
the rightmost term of the second interval. This case needs to be considered separately.

With that said, let's get the exercise done.

(define (mul-interval x y)
  (cond ((and (and (< (lower-bound x) 0) (< (upper-bound x) 0))
	      (and (< (lower-bound y) 0) (> (upper-bound y) 0)))
	 (make-interval (* (lower-bound x) (upper-bound y))
			(* (lower-bound x) (lower-bound y))))
	((and (and (> (lower-bound x) 0) (> (upper-bound x) 0))
	      (and (< (lower-bound y) 0) (> (upper-bound y) 0)))
	 (make-interval (* (upper-bound x) (lower-bound y))
			(* (upper-bound x) (upper-bound y))))
	((and (and (< (lower-bound x) 0) (> (upper-bound x) 0))
	      (and (< (lower-bound y) 0) (< (upper-bound y) 0)))
	 (make-interval (* (upper-bound x) (lower-bound y))
			(* (lower-bound x) (lower-bound y))))
	((and (and (< (lower-bound x) 0) (< (upper-bound x) 0))
	      (and (< (lower-bound y) 0) (< (upper-bound y) 0)))
	 (make-interval (* (upper-bound x) (upper-bound y))
			(* (lower-bound x) (lower-bound y))))
	((and (and (> (lower-bound x) 0) (> (upper-bound x) 0))
	      (and (< (lower-bound y) 0) (< (upper-bound y) 0)))
	 (make-interval (* (upper-bound x) (lower-bound y))
			(* (lower-bound x) (upper-bound y))))
	((and (and (< (lower-bound x) 0) (> (upper-bound x) 0))
	      (and (> (lower-bound y) 0) (> (upper-bound y) 0)))
	 (make-interval (* (lower-bound x) (upper-bound y))
			(* (upper-bound x) (upper-bound y))))
	((and (and (< (lower-bound x) 0) (< (upper-bound x) 0))
	      (and (> (lower-bound y) 0) (> (upper-bound y) 0)))
	 (make-interval (* (lower-bound x) (upper-bound y))
			(* (upper-bound x) (lower-bound y))))
	((and (and (> (lower-bound x) 0) (> (upper-bound x) 0))
	      (and (> (lower-bound y) 0) (> (upper-bound y) 0)))
	 (make-interval (* (lower-bound x) (lower-bound y))
			(* (upper-bound x) (upper-bound y))))
	(else (let ((p1 (* (lower-bound x) (lower-bound y)))
		    (p2 (* (lower-bound x) (upper-bound y)))
		    (p3 (* (upper-bound x) (lower-bound y)))
		    (p4 (* (upper-bound x) (upper-bound y))))
		(make-interval (min p1 p2 p3 p4)
			       (max p1 p2 p3 p4))))))
;Value: mul-interval





It's time to check the formula.

(define (make-interval a b) (cons a b))
;Value: make-interval

(define (upper-bound i) (cdr i))
;Value: upper-bound

(define (lower-bound i) (car i))
;Value: lower-bound

(define (mul-interval-old x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
;Value: mul-interval-old

(define a (make-interval (- 2) 3))
;Value: a

(define b (make-interval (- 3) 2))
;Value: b

(mul-interval a b)
;Value 3: (-9 . 6)

(mul-interval-old a b)
;Value 4: (-9 . 6)

(define a (make-interval (- 3) (- 2)))
;Value: a

(define b (make-interval (- 4) 6))
;Value: b

(mul-interval a b)
;Value 5: (-18 . 12)

(mul-interval-old a b)
;Value 6: (-18 . 12)


(define a (make-interval 2 3))
;Value: a

(define b (make-interval (- 2) 4))
;Value: b

(mul-interval a b)
;Value 7: (-6 . 12)

(mul-interval-old a b)
;Value 8: (-6 . 12)


(define a (make-interval (- 2) 3))

(define b (make-interval (- 6) (- 4)))
;Value: b

(mul-interval a b)
;Value 10: (-18 . -8)

(mul-interval-old a b)
;Value 11: (-18 . -8)

(define a (make-interval (- 3) (- 2)))
;Value: a


(mul-interval a b)
;Value 18: (8 . 18)


(mul-interval-old a b)
;Value 19: (8 . 18)


(define a (make-interval 2 3))
;Value: a

(mul-interval a b)
;Value 20: (-18 . -8)

(mul-interval-old a b)
;Value 21: (-18 . -8)


(define a (make-interval (- 2) 3))
;Value: a

(define b (make-interval 4 7))
;Value: b

(mul-interval a b)
;Value 22: (-14 . 21)

(mul-interval-old a b)
;Value 23: (-14 . 21)

(define a (make-interval (- 3) (- 2)))
;Value: a

(mul-interval a b)
;Value 26: (-21 . -8)


(mul-interval-old a b)
;Value 27: (-21 . -8)

(define a (make-interval 2 3))
;Value: a

(mul-interval a b)
;Value 28: (8 . 21)

(mul-interval-old a b)
;Value 29: (8 . 21)



***

One more solution:


(define (mul-interval x y)
  (cond ((and (< (lower-bound x) 0) (> (upper-bound x) 0)
	      (< (lower-bound y) 0) (> (upper-bound y) 0))
	 (make-interval (min (* (lower-bound x) (upper-bound y))
			     (* (upper-bound x) (lower-bound y)))
			(max (* (lower-bound x) (lower-bound y))
			     (* (upper-bound x) (upper-bound y)))))
	((and (< (lower-bound x) 0) (> (upper-bound x) 0)
	      (< (lower-bound y) 0) (< (upper-bound y) 0))
	 (make-interval (* (upper-bound x) (lower-bound y))
			(* (lower-bound x) (lower-bound y))))
	((and (< (lower-bound x) 0) (> (upper-bound x) 0)
	      (> (lower-bound y) 0) (> (upper-bound y) 0))
	 (make-interval (* (lower-bound x) (upper-bound y))
			(* (upper-bound x) (upper-bound y))))
	((and (< (lower-bound x) 0) (< (upper-bound x) 0)
	      (< (lower-bound y) 0) (> (upper-bound y) 0))
	 (make-interval (* (lower-bound x) (upper-bound y))
			(* (lower-bound x) (lower-bound y))))
	((and (< (lower-bound x) 0) (< (upper-bound x) 0)
	      (< (lower-bound y) 0) (< (upper-bound y) 0))
	 (make-interval (* (upper-bound x) (upper-bound y))
			(* (lower-bound x) (lower-bound y))))
	((and (< (lower-bound x) 0) (< (upper-bound x) 0)
	      (> (lower-bound y) 0) (> (upper-bound y) 0))
	 (make-interval (* (lower-bound x) (upper-bound y))
			(* (upper-bound x) (lower-bound y))))
	((and (< (lower-bound y) 0) (> (upper-bound y) 0)
	      (> (lower-bound x) 0) (> (upper-bound y) 0))
	 (make-interval (* (upper-bound x) (lower-bound y))
			(* (upper-bound x) (upper-bound y))))
	((and (> (lower-bound x) 0) (> (upper-bound x) 0)
	      (< (lower-bound y) 0) (< (upper-bound y) 0))
	 (make-interval (* (upper-bound x) (lower-bound y))
			(* (lower-bound x) (upper-bound y))))
	((and (> (lower-bound x) 0) (> (upper-bound x) 0)
	      (> (lower-bound x) 0) (> (upper-bound y) 0))
	 (make-interval (* (lower-bound x) (lower-bound y))
			(* (upper-bound x) (upper-bound y))))))
;Value: mul-interval


