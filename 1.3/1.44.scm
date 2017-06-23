
(define (compose f g)
  (lambda (x) (f (g x))))
;Value: compose

(define (repeated func n)
  (define (iter i)
    (if (< i n)
	(compose func (iter (+ i 1)))
	(lambda (x) (func x))))
  (iter 1))
;Value: repeated

(define (inc x) (+ x 1))
;Value: inc

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) 
		    (f x) 
		    (f (+ x dx))) 
		 3)))
;Value: smooth

(define dx 0.00001)
;Value: dx


(define (smooth-n f n)
  ((repeated (lambda (g) (smooth g)) n) f))
;Value: smooth-n

((smooth-n sin 2) 5)
;Value: -.9589242745992101

((repeated (smooth sin) 2) 5)
;Value: -.8185741444160732

(((repeated (lambda (g) (smooth g)) 2) sin) 5)
;Value: -.9589242745992101

we need to apply (smooth (smooth (smooth ... sin)))
and not (smooth (smooth (smooth ... number(like 5))))

Hence, we pass a function (sin) to the repeated procedure.


***

Just another solution:

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
;Value: n-fold-smooth

