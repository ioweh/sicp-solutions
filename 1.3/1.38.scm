
(define (cont-frac n d k)
  (define (frac i)
    (if (< i k)
	(/ (n i) (+ (d i) (frac (+ i 1))))
        (/ (n i) (d i))))
  (frac 1))
;Value: cont-frac

(cont-frac (lambda (i) 1.0)
	   (lambda (i) (cond ((= i 1) 1)
			     ((= i 2) 2)
			     ((= (remainder (- i 2) 3) 0) (+ (* (/ (- i 2) 3) 2) 2))
			     (else 1)))
	   11)
;Value: .7182818352059925










