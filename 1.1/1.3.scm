(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-of-2largs x y z)
  (cond ((and (< x y) (< x z)) (sum-of-squares y z))
	((and (< y z) (< y x)) (sum-of-squares x z))
	(else (sum-of-squares x y))))


(define (sum-of-largest-squares a b c)
  (cond ((and (> a c) (> b c)) (sum-of-squares a b))
	((and (> a b) (> c b)) (sum-of-squares a c))
	(else (sum-of-squares b c))))







