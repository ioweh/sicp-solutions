
(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var) 1 0))
	((sum? exp)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product (multiplier exp)
			(deriv (multiplicand exp) var))
	  (make-product (deriv (multiplier exp) var)
			(multiplicand exp))))
	(else
	 (error "unknown expression type -- DERIV" exp))))
;Value: deriv

(define (variable? x) (symbol? x))
;Value: variable?

(variable? 'x)
;Value: #t

(variable? 2)
;Value: #f

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
;Value: same-variable?

(define (make-sum a1 a2) (list '+ a1 a2))
;Value: make-sum

(define (make-product m1 m2) (list '* m1 m2))
;Value: make-product

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
;Value: sum?

(define (addend s) (cadr s))
;Value: addend

(define (augend s) (caddr s))
;Value: augend

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
;Value: product?

(define (multiplier p) (cadr p))
;Value: multiplier

(define (multiplicand p) (caddr p))
;Value: multiplicand

(deriv '(+ x 3) 'x)
;Value 7: (+ 1 0)

(deriv '(* x y) 'x)
;Value 8: (+ (* x 0) (* 1 y))

(deriv '(* (* x y) (+ x 3)) 'x)
;Value 9: (+ (* (* x y) (+ 1 0)) (* (+ (* x 0) (* 1 y)) (+ x 3)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))
;Value: make-sum

(define (=number? exp num)
  (and (number? exp) (= exp num)))
;Value: =number?

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))
;Value: make-product

(deriv '(+ x 3) 'x)
;Value: 1

(deriv '(* x y) 'x)
;Value: y

(deriv '(* (* x y) (+ x 3)) 'x)
;Value 10: (+ (* x y) (* y (+ x 3)))

