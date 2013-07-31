
(load "differentiation.scm")
;Loading "differentiation.scm"... done
;Value 2: (+ (* x y) (* y (+ x 3)))

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
	((exponentiation? exp)
	 (make-product (make-product (exponent exp)
				     (make-exponentiation (base exp)
							  (- (exponent exp) 1)))
		       (deriv (base exp) var)))
	(else
	 (error "unknown expression type -- DERIV" exp))))
;Value: deriv

(define (make-exponentiation var power)
  (cond ((and (number? power) (= power 0)) 1)
	((and (number? power) (= power 1)) var)
	(else
	 (list '** var power))))
;Value: make-exponentiation

(define base cadr)
;Value: base

(define exponent caddr)
;Value: exponent

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
;Value: exponentiation?

(deriv '(** x 3) 'x)
;Value 9: (* 3 (** x 2))

(make-exponentiation 'x 'y)
;Value 10: (** x y)

(make-exponentiation 'x 2)
;Value 11: (** x 2)

(make-exponentiation 'x 1)
;Value: x

(make-exponentiation 'x 0)
;Value: 1

