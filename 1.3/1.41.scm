
(define (double procedure)
  (lambda (x) (procedure (procedure x))))
;Value: double

(define (inc x)
  (+ x 1))
;Value: inc

((double inc) 1)
;Value: 3

((double inc) 5)
;Value: 7

(((double (double double)) inc) 5)


(double double)

(lambda (x) (double (double x)))



(((lambda (x) (double (double x))) inc) 5)
;Value: 9

(inc (inc (inc (inc 5))))
;Value: 9


Let's now use the whole expression.

(((double (double double)) inc) 5)

(((double (lambda (x) (double (double x)))) inc) 5)

(((lambda (x) (lambda (x) (double (double (lambda (x) (double (double x))))))) inc) 5)

((double (double (double (double inc)))) 5)
((double (double (double (lambda (x) (inc (inc x)))))) 5)
((double (double (lambda (x) (inc (inc (lambda (x) (inc (inc x)))))))) 5)
((double (double (lambda (x) (inc (inc (inc (inc x))))))) 5)
((double (lambda (x) (lambda (x) (inc (inc (inc (inc (lambda (x) (inc (inc (inc (inc x)))))))))))) 5)

(inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc 5))))))))))))))))
;Value: 21

(((double (double double)) inc) 5)
;Value: 21

