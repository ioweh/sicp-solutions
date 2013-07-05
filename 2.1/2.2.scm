
(define (make-point x y)
  (cons x y))
;Value: make-point

(define (x-point point)
  (car point))
;Value: x-point

(define (y-point point)
  (cdr point))
;Value: y-point

(define p (make-point 3 7))
;Value: p

(x-point p)
;Value: 3

(y-point p)
;Value: 7

(define (make-segment point1 point2)
  (cons point1 point2))
;Value: make-segment

(define (start-segment segment)
  (car segment))
;Value: start-segment

(define (end-segment segment)
  (cdr segment))
;Value: end-segment


(define (midpoint-segment segment)
  (cons (/ (+ (x-point (start-segment segment))
	      (x-point (end-segment segment))) 2)
	(/ (+ (y-point (start-segment segment))
	      (y-point (end-segment segment))) 2)))
;Value: midpoint-segment

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
;Value: print-point

(define p1 (make-point 3 8))
;Value: p1

(define p2 (make-point 9 12))
;Value: p2

(print-point p1)

(3,8)
;Unspecified return value

(print-point p2)

(9,12)
;Unspecified return value

(define s (make-segment p1 p2))
;Value: s

(define mp (midpoint-segment s))
;Value: mp

(print-point mp)

(6,10)
;Unspecified return value

