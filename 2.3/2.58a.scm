
(load "differentiation.scm")
;Loading "differentiation.scm"... done
;Value 6: (+ (* x y) (* y (+ x 3)))


(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else
	 (list a1 '+ a2))))
;Value: make-sum

(make-sum 2 3)
;Value 7: (2 + 3)

(define (addend s)
  (car s))
;Value: addend

(define (augend s)
  (caddr s))
;Value: augend

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))
;Value: sum?

(deriv '(x + 3) 'x)
;Value: 1


(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list m1 '* m2))))
;Value: make-product

(define (multiplier p)
  (car p))
;Value: multiplier

(define (multiplicand p)
  (caddr p))
;Value: multiplicand

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))
;Value: product?

(deriv '(x * y) 'x)
;Value: y

(deriv '((x * y) * (x + 3)) 'x)
;Value 10: ((x * y) + (y * (x + 3)))

