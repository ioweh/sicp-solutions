
(define (cont-frac n d k)
  (define (frac i)
    (if (< i k)
	(/ (n i) (+ (d i) (frac (+ i 1))))
	(/ (n i) (d i))))
  (frac 1))
;Value: cont-frac

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)
;Value: .6180555555555556

(define (tan-cf x k)
  (cont-frac (lambda (n) (if (= n 1)
			     x
			     (- (square x))))
	     (lambda (k) (- (* 2 k) 1))
	     k))
;Value: tan-cf


(* 1.0 (tan-cf (/ 3.14 4) 11))
;Value: .9992039901050428








