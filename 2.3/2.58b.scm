
(load "differentiation.scm")
;Loading "differentiation.scm"... done
;Value 2: (+ (* x y) (* y (+ x 3)))

(define exp '(x + 3 * (x + y + 2)))
;Value: exp

(car exp)
;Value: x

(cdr exp)
;Value 11: (+ 3 * (x + y + 2))

(define (sum? e)
  (and (pair? e)
       (eq? (cadr e) '+)))
;Value: sum?

(define (product? e)
  (and (pair? e)
       (eq? (cadr e) '*)))
;Value: product?

(sum? exp)
;Value: #t

(pair? (cdddr '(+ x 3)))
;Value: #f

(define (augend s)
  (if (pair? (cdddr s))
      (cddr s)
      (caddr s)))
;Value: augend


(augend '(x + 3))
;Value: 3

(augend '(x + 3 * (x + y + 2)))
;Value 18: (3 * (x + y + 2))

(define addend car)
;Value: addend

(addend '(x + 3))
;Value: x

(define multiplier car)
;Value: multiplier

(define (multiplicand p)
  (if (pair? (cdddr p))
      (cddr p)
      (caddr p)))
;Value: multiplicand

(multiplicand '(3 * (x + y + 2)))
;Value 19: (x + y + 2)

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list a1 '+ a2))))
;Value: make-sum

(deriv '(x + 3 + x) 'x)
;Value: 2

(deriv '(x + 3 + (x + y + 2)) 'x)
;Value: 2

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list m1 '* m2))))
;Value: make-product

(deriv '(x + 3 * (x + y + 2)) 'x)
;Value: 4

(deriv '(x + 3 * (x + y + 2)) 'y)
;Value: 3



***

The previous solution is incorrect. To check it, consider the following case:

(display (deriv '(x * x + 2) 'x))

The answer will be simply x. To fix it, we need to consider the sum any expression that contains the "+" sign, and product - anything that is not a sum. Also, in case of the sum, both addend and augend can be lists and we need to take it into consideration. The fixed version of the solution is given below:

(define (sum? x)
  (and (pair? x) (accumulate (lambda (el acc) (if (eq? el '+) #t acc)) #f x)))

(define (addend s)
  (define (addend-as-a-list s) (if (eq? (cadr s) '+)
                                   (list (car s))
                                   (cons (car s) (cons '* (addend-as-a-list (cddr s))))))
  (let ((result (addend-as-a-list s)))
    (if (null? (cdr result))
        (car result)
        result)))

(define (augend s)
  (define (augend-as-a-list s) (if (eq? (cadr s) '+)
                                   (cddr s)
                                   (augend (cddr s))))
  (let ((result (augend-as-a-list s)))
    (if (and (list? result) (null? (cdr result)))
        (car result)
        result)))

(define (product? x)
    (not (sum? x)))

(define (multiplier p) (car p))

(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (cddr p)))

