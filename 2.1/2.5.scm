
As 2 is even and 3 is odd, if we multiply the expression by 2 or 3,
the result is always different.

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
;Value: cons

(cons 1 2)
;Value: 18

(cons 2 2)
;Value: 36

Next, we need to use the following identity:

m*log(x) + n*log(y) = log(x^m * y^n)

a*log2(2) + b*log2(3) = log2(2^a*3^b)

a*log3(2) + b*log3(3) = log3(2^a*3^b)

(define (log2 x)
  (/ (log x) (log 2)))
;Value: log2

(define (log3 x)
  (/ (log x) (log 3)))
;Value: log3


a + b*log2(3) = log2(z)
a*log3(2) + b = log3(z)

a = log2(z) - b*log2(3)

(log2(z) - b*log2(3)) * log3(2) + b = log3(z)
log2(z) * log3(2) - b*log2(3)*log3(2) + b = log3(z)
b(1-log2(3)*log3(2)) = log3(z) - log2(z)*log3(2)
b = (log3(z) - log2(z)*log3(2)) / (1 - log2(3)*log3(2))

b = log3(z) - a*log3(2)
a + (log3(z) - a*log3(2))*log2(3) = log2(z)
a + log3(z)*log2(3) - a*log3(2)*log2(3) = log2(z)
a(1-log3(2)*log2(3)) = log2(z) - log3(z)*log2(3)
a = (log2(z) - log3(z)*log2(3)) / (1 - log3(2)*log2(3))

(define (car z)
  (/ (- (log2 z) (* (log3 z) (log2 3))) (- 1 (* (log3 2) (log2 3)))))
;Value: car

(define (cdr z)
  (/ (- (log3 z) (* (log2 z) (log3 2))) (- 1 (* (log2 3) (log3 2)))))
;Value: cdr


(define c (cons 1 2))
;Value: c

(car c)
;Value: #[NaN]

(cdr c)
;Value: #[-inf]


c
;Value: 18


(define (car c)
  (if (= (remainder c 2) 0)
      (+ 1 (car (/ c 2)))
      0))
;Value: car

(define d (cons 15 16))
;Value: d

(car d)
;Value: 15

(define (cdr c)
  (if (= (remainder c 3) 0)
      (+ 1 (cdr (/ c 3)))
      0))
;Value: cdr

(cdr d)
;Value: 16

(cons 15 16)
;Value: 1410554953728

(define (car-iterative c)
  (define (iter c acc)
    (if (= (remainder c 2) 0)
	(iter (/ c 2) (+ acc 1))
	acc))
  (iter c 0))
;Value: car-iterative

(car-iterative d)
;Value: 15

(define (cdr-iterative c)
  (define (iter c acc)
    (if (= (remainder c 3) 0)
	(iter (/ c 3) (+ acc 1))
	acc))
  (iter c 0))
;Value: cdr-iterative

(cdr-iterative d)
;Value: 16

