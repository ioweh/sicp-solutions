
(define zero (lambda (f) (lambda (x) x)))
;Value: zero

zero
;Value 2: #[compound-procedure 2 zero]

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
;Value: add-1

add-1
;Value 4: #[compound-procedure 4 add-1]

(add-1 3)
;Value 5: #[compound-procedure 5]

(add-1 zero)

(add-1 (lambda (f) (lambda (x) x)))

(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))

(lambda (f) (lambda (x) (f ((lambda (x) x) x))))

(lambda (f) (lambda (x) (f x)))


(define one (lambda (f) (lambda (x) (f x))))
;Value: one

one
;Value 6: #[compound-procedure 6 one]

(add-1 one)

(add-1 (lambda (f) (lambda (x) (f x))))

(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))

(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))

(lambda (f) (lambda (x) (f (f x))))


(define two (lambda (f) (lambda (x) (f (f x)))))
;Value: two

two
;Value 7: #[compound-procedure 7 two]

Let's consider a particular case.

(f ((n f) x))

Say, n is (lambda (f) (lambda (x) (f x)))

(lambda (f)), and, consequently, (lambda (x)) need to be removed.

In order to remove (lambda (f)) we need to apply the function including this lambda to f.
In order to remove (lambda (x)) we need to apply the function including the lambda to x.

It is clearly seen in the structure of the procedure.

(f ((n f) x))

First, lambda (f) is removed. Then lambda (x). The stripped function (f (f x)) is left.

Now, we need to apply the function m amount of times.

For example, m could be (lambda (f) (lambda (x) (f (f (f x))))).

(m f) is ((lambda (f) (lambda (x) (f (f (f x))))) f),

(m f) = (lambda (x) (f (f (f x)))).

We need to apply this function to the argument (f ((n f) x)). Then the definition of the addition procedure will be:

(define (+ m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))
;Value: +

Let's consider an example:

m is (lambda (f) (lambda (x) (f (f (f x)))))
n is (lambda (f) (lambda (x) (f (f x))))

(+ m n)

(+ (lambda (f) (lambda (x) (f (f (f x)))))
   (lambda (f) (lambda (x) (f (f x)))))

(lambda (f) (lambda (x) (((lambda (f) (lambda (x) (f (f (f x))))) f)
			 (((lambda (f) (lambda (x) (f (f x)))) f) x))))

(lambda (f) (lambda (x) ((lambda (x) (f (f (f x))))
			 (f (f x)))))

(lambda (f) (lambda (x) (f (f (f (f (f x)))))))

