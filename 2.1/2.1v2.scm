
(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< d 0)
	(cons (* (- 1) (/ n g)) (* (- 1) (/ d g)))
	(cons (/ n g) (/ d g)))))
;Value: make-rat

(define numer car)
;Value: numer

(define denom cdr)
;Value: denom

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
;Value: print-rat

(define a (make-rat (- 1) 2))
;Value: a

(print-rat a)

-1/2
;Unspecified return value

(define b (make-rat 1 (- 2)))
;Value: b

(print-rat b)

-1/2
;Unspecified return value

(define c (make-rat 1 2))
;Value: c

(print-rat c)

1/2
;Unspecified return value

(define d (make-rat (- 1) (- 2)))
;Value: d

(print-rat d)

1/2
;Unspecified return value

