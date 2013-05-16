(even? 2)
;Value: #t

even?
;Value 2: #[compiled-procedure 2 ("arith" #xa5) #x5 #x3603f]

(define (fast-expt-iterative b n)
  (fast-expt-iter 1 b n))
;Value: fast-expt-iterative

(define (fast-expt-iter a b n)
  (if (= n 0)
      a
      (if (even? n)
	  (fast-expt-iter a (square b) (/ n 2))
	  (fast-expt-iter (* a b) b (- n 1)))))
;Value: fast-expt-iter

(fast-expt-iterative 2 3)
;Value: 8

