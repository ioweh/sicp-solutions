
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


***

Let's use another approach:

(define (double f)
  (lambda (x) (f (f x))))
;Value: double

(define inc
  (lambda (x) (+ x 1)))
;Value: inc

((double inc) 2)
;Value: 4

(((double (lambda (a) (double (double a)))) inc ) 5)
;Value: 21

(((lambda (b) ((lambda (a) (double (double a))) ((lambda (c) (double (double c))) b))) inc) 5)
;Value: 21

(((lambda (a) (double (double a))) ((lambda (c) (double (double c))) inc)) 5)
;Value: 21

(((lambda (a) (double (double a))) (double (double inc))) 5)
;Value: 21

(((lambda (a) (double (double a))) (double (lambda (d) (inc (inc d))))) 5)
;Value: 21

(((lambda (a) (double (double a))) (lambda (e) ((lambda (d) (inc (inc d))) ((lambda (f) (inc (inc f))) e)))) 5)
;Value: 21

((double (double (lambda (e) ((lambda (d) (inc (inc d))) ((lambda (f) (inc (inc f))) e))))) 5)
;Value: 21

((double (lambda (g) ((lambda (e) ((lambda (d) (inc (inc d))) ((lambda (f) (inc (inc f))) e))) ((lambda (e) ((lambda (i) (inc (inc i))) ((lambda (h) (inc (inc h))) e))) g)))) 5)
;Value: 21

((lambda (i) ((lambda (g) ((lambda (e) ((lambda (d) (inc (inc d))) ((lambda (f) (inc (inc f))) e))) ((lambda (e) ((lambda (i) (inc (inc i))) ((lambda (h) (inc (inc h))) e))) g))) ((lambda (j) ((lambda (k) ((lambda (l) (inc (inc l))) ((lambda (m) (inc (inc m))) k))) ((lambda (n) ((lambda (o) (inc (inc o))) ((lambda (p) (inc (inc p))) n))) j))) i))) 5)
;Value: 21

((lambda (g) ((lambda (e) ((lambda (d) (inc (inc d))) ((lambda (f) (inc (inc f))) e))) ((lambda (e) ((lambda (i) (inc (inc i))) ((lambda (h) (inc (inc h))) e))) g))) ((lambda (j) ((lambda (k) ((lambda (l) (inc (inc l))) ((lambda (m) (inc (inc m))) k))) ((lambda (n) ((lambda (o) (inc (inc o))) ((lambda (p) (inc (inc p))) n))) j))) 5))
;Value: 21

((lambda (g) ((lambda (e) ((lambda (d) (inc (inc d))) ((lambda (f) (inc (inc f))) e))) ((lambda (e) ((lambda (i) (inc (inc i))) ((lambda (h) (inc (inc h))) e))) g))) ((lambda (k) ((lambda (l) (inc (inc l))) ((lambda (m) (inc (inc m))) k))) ((lambda (n) ((lambda (o) (inc (inc o))) ((lambda (p) (inc (inc p))) n))) 5)))
;Value: 21

((lambda (g) ((lambda (e) ((lambda (d) (inc (inc d))) ((lambda (f) (inc (inc f))) e))) ((lambda (e) ((lambda (i) (inc (inc i))) ((lambda (h) (inc (inc h))) e))) g))) ((lambda (k) ((lambda (l) (inc (inc l))) ((lambda (m) (inc (inc m))) k))) ((lambda (o) (inc (inc o))) ((lambda (p) (inc (inc p))) 5))))
;Value: 21

((lambda (g) ((lambda (e) ((lambda (d) (inc (inc d))) ((lambda (f) (inc (inc f))) e))) ((lambda (e) ((lambda (i) (inc (inc i))) ((lambda (h) (inc (inc h))) e))) g))) 13)
;Value: 21

21
;Value: 21
