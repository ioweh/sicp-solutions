(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))
;Value: sum

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (next a)
    (+ a (* 2 h)))
  (* (+ (f a)
	(* 4 (sum f (+ a h) next b))
	(* 2 (sum f (+ a (* 2 h)) next (- b h)))
	(f b))
     (/ h 3)))
;Value: integral

***

Another solution:

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))
;Value: sum

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (next x) (+ x h))
  (define (term x)
    (cond ((or (= x a) (= x b))(f x))
	  ((even? (/ (- x a) h)) (* 2 (f x)))
	  (else (* 4 (f x)))))
  (* (/ h 3) (sum term a next b)))
;Value: simpson-integral

(define (cube x) (* x x x))
;Value: cube

(simpson-integral cube 0 1 100)
;Value: 1/4



