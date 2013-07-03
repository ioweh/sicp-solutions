
From section 1.2.2

phi^2 = phi + 1

phi = 1 + 1/phi

(define (cont-frac n d k)
  (if (or (= k 1) (< k 1))
      (+ 1 (/ (n 1) (d 1)))
      (+ (d 1) (/ (n 1) (cont-frac n d (- k 1))))))
;Value: cont-frac


(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   10)
;Value: 1.6179775280898876

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   20)
;Value: 1.618033985017358

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   12)
;Value: 1.6180257510729614

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)
;Value: 1.6180555555555556

The procedure takes 11 steps to get an approximation that is accurate to 4 decimal places.

Let's write the cont-frac procedure that generates an iterative process.

(define (cont-frac-acc n d k accumulator)
  (if (or (= k 1) (< k 1))
      (+ 1 (/ 1 accumulator))
      (cont-frac-acc n d (- k 1) (+ (d k) (/ (n k) accumulator)))))
;Value: cont-frac-acc




(define (cont-frac n d k)
  (cont-frac-acc n d k 1))
;Value: cont-frac

(* 1.0 (cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11))
;Value: 1.6180555555555556





