
(define (spans-zero? interval)
  (and (> (upper-bound interval) 0)
       (< (lower-bound interval) 0)))
;Value: spans-zero?

(define (div-interval x y)
  (if (spans-zero? y)
      (error "Kernel panic. The interval spans zero." y)
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))
;Value: div-interval


(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))
;Value: mul-interval

(define (make-interval a b) (cons a b))
;Value: make-interval

(define (upper-bound interval) (cdr interval))
;Value: upper-bound

(define (lower-bound interval) (car interval))
;Value: lower-bound

(define i (make-interval 4 6))
;Value: i

i
;Value 3: (4 . 6)

(define z (make-interval (- 1) 5))
;Value: z

(div-interval i z)
;Kernel panic. The interval spans zero. (-1 . 5)
;To continue, call RESTART with an option number:
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

