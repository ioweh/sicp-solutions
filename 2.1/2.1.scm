
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((and (< n 0) (< d 0))
	   (cons (/ (- n) g) (/ (- d) g)))
	  ((and (> n 0) (> d 0))
	   (cons (/ n g) (/ d g)))
	  ((and (> n 0) (< d 0))
	   (cons (/ (- n) g) (/ (- d) g)))
	  ((and (< n 0) (> d 0))
	   (cons (/ n g) (/ d g))))))
;Value: make-rat


(define (numer x) (car x))
;Value: numer

(define (denom x) (cdr x))
;Value: denom

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
;Value: print-rat

(define x (make-rat (- 1) 2))
;Value: x

(print-rat x)

-1/2
;Unspecified return value

(define y (make-rat 1 (- 2)))
;Value: y

(print-rat y)

-1/2
;Unspecified return value

(define z (make-rat (- 1) (- 2)))
;Value: z

(print-rat z)

1/2
;Unspecified return value

