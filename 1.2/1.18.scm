(define (double x)
  (+ x x))
;value: double

(define (halve x)
  (/ x 2))
;value: halve

; let's define an invariant quantity
; (* iq (* a b)) = const
; 1-st iteration
; (* iq (* (double a) (halve b))) = const
; iq is still 1
; n-th iteration
; (* iq (* (double (double ... a)) 1)) = const
; iq = (* (double (double (double ... a))))

(define (* a b)
  (cond ((= b 1) a)
	((even? b) (* (double a) (halve b)))
	(else (+ a (* a (- b 1))))))
;Value: *

(* 2 3)
;Value: 6

(* 4 5)
;Value: 20



