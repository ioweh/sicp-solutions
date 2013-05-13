
(define (f n)
  (cond ((< n 3) n)
	(else (+ (f (- n 1)) 
		 (* 2 (f (- n 2))) 
		 (* 3 (f (- n 3)))))))
;Value: f

(f 10)
;Value: 1892


(define (f n)
  (iter-f 2 1 0 3 n))
;Value: f


(define (iter-f f1 f2 f3 counter maxcount)
  (cond (( or (> counter maxcount) (= counter maxcount)) (+ f1 (* 2 f2) (* 3 f3)))
	(else (iter-f (+ f1 (* 2 f2) (* 3 f3))
		      f1
		      f2
		      (+ counter 1)
		      maxcount))))
;Value: iter-f

(f 10)
;Value: 1892




