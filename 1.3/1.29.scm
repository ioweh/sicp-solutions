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
















