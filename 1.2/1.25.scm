(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
;Value: expmod

; Note: this technique is useful because it means we can perform our computation
; without ever having to deal with numbers much larger than m.


(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
;Value: expmod


(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))
;Value: fast-expt


It depends on how the remainder procedure is implemented. In the first procedure, all numbers that remainder takes are small.
In the second procedure we can get a very big number if the prime number is big and the base < than the prime number.
We can easily run out of memory in the second case.


