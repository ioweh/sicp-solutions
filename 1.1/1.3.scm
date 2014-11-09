(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-of-2largs x y z)
  (cond ((and (< x y) (< x z)) (sum-of-squares y z))
        ((and (< y z) (< y x)) (sum-of-squares x z))
	((and (< z x) (< z y)) (sum-of-squares x y))))

(define (take-three a b c)
  (if (> a b)
      (if (> b c)
	  (+ (* a a) (* b b))
	  (+ (* a a) (* c c)))
      (if (> a c)
	  (+ (* a a) (* b b))
	  (+ (* b b) (* c c)))))

(take-three 1 2 3)

(take-three 3 2 1)

(take-three 8 1 3)

(take-three 1 3 8)

(take-three 1 8 3)

(take-three 3 8 1)


