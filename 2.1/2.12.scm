
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
;Value: make-center-width

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
;Value: center

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
;Value: width

(define (make-interval a b) (cons a b))
;Value: make-interval

(define (upper-bound i) (cdr i))
;Value: upper-bound

(define (lower-bound i) (car i))
;Value: lower-bound


Now let's move on to this definition:

"6.8 ohms with 10% tolerance" means that the resistor has a resistance
between 6.8-0.68 = 6.12 and 6.8+0.68=7.48 ohms.

(define (percent i)
  (/ (* (width i) 100) (center i)))
;Value: percent


(define (make-center-percent c p)
  (make-interval (- c (/ (* c p) 100))
		 (+ c (/ (* c p) 100))))
;Value: make-center-percent

(define interval (make-center-percent 6.8 10))
;Value: interval

interval
;Value 4: (6.12 . 7.4799999999999995)

(percent interval)
;Value: 9.999999999999996


(define (make-center-percent c p)
  (make-center-width c (/ (* c p) 100)))
;Value: make-center-percent

(define a (make-center-percent 5 20))
;Value: a

a
;Value 6: (4 . 6)

(center a)
;Value: 5

(width a)
;Value: 1

(percent a)
;Value: 20

