(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-of-2largs x y z)
  (cond ((and (< x y) (< x z)) (sum-of-squares y z))
	((and (< y z) (< y x)) (sum-of-squares x z))
	(else (sum-of-squares x y))))

(define (sum-largest-two-of-three a b c)
  (if (> a b)
      (if (> b c)
	  (+ (* a a) (* b b))
	  (+ (* a a) (* c c)))
      (if (> a c)
	  (+ (* a a) (* b b))
	  (+ (* b b) (* c c)))))

(sum-largest-two-of-three 1 2 3)

(sum-largest-two-of-three 3 2 1)

(sum-largest-two-of-three 8 1 3)

(sum-largest-two-of-three 1 3 8)

(sum-largest-two-of-three 1 8 3)

(sum-largest-two-of-three 3 8 1)


