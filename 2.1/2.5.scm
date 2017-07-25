
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


***

There's one more solution. We can factorize the log3 (2^a * 3^b):

log3 (2^a * 3^b) = a * log3 2 + b

The first multiplier is not an integer, while the second one is an integer. We can exploit this fact and use the floor function to transform the equation above to the following one:

log3 (2^a * 3^b) = k + b,

where both terms are integers. Note that it's not important what k is. We will raise 3 to the power of the number we just received and take the greatest common divisor of the number x, which, in turn, is a cons of two other numbers, one of which we try to calculate.

gcd(2^a * 3^b, 3^k * 3^b) = 3^b

Now let's divide the number x by the result we received:

2^a * 3^b / 3^b = 2^a

And take the base 2 logarithm of the number:

log2 2^a = a

We just received the first item of the pair. All the conclusions for the second item can be done in a similar manner. The illustrating example is given below.


(define (log3 x)
  (/ (log x) (log 3)))
;Value: log3

(define (log2 x)
  (/ (log x) (log 2)))
;Value: log2

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))
;Value: cons

(define x (cons 4 7))
;Value: x

x
;Value: 34992

(define (car x)
  (log2 (/ x (gcd x (expt 3 (floor (log3 x)))))))
;Value: car

(car 34992)
;Value: 4.

(define (cdr x)
  (log3 (/ x (gcd x (expt 2 (floor (log2 x)))))))
;Value: cdr

(cdr 34992)
;Value: 7.

