(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))
;Value: *

(* 3 4)
;Value: 12

(define (double x)
  (+ x x))
;Value: double


(define (halve x)
  (/ x 2))
;Value: halve

; a+a+a+a+a+a+a+a... b times
; 2a+2a+2a+2a... = 2(a+a+a+a) b/2 times
; 4a+4a... b/4 times
; 8a... b/8 times, if b=8 then just one time

(define (* a b)
  (cond ((= b 0) 0)
	((even? b) (double (* a (halve b))))
	(else (+ a (* a (- b 1))))))
;Value: *

(* 2 2)
;Value: 4

(* 2 3)
;Value: 6

(* 5 3)
;Value: 15










