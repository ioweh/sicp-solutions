
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))

(f 6) = 59

(define (f-new n)
  (f-iter 3 2 1 0 n))

(define (f-iter counter a b c n)
  (if (> counter n)
      a
      (f-iter (+ counter 1)
	      (+ a (* 2 b) (* 3 c))
	      a
	      b
	      n)))

(f-new 6) = 59

