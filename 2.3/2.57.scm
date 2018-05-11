
(load "differentiation.scm")
;Loading "differentiation.scm"... done
;Value 2: (+ (* x y) (* y (+ x 3)))

(deriv '(* (* x y) (+ x 3)) 'x)
;Value 4: (+ (* x y) (* y (+ x 3)))

(deriv '(+ x 3) 'x)
;Value: 1

(define (augend s)
  (if (pair? (cdddr s))
      (cons '+ (cddr s))
      (caddr s)))
;Value: augend


(deriv '(+ x 3) 'x)
;Value: 1

(deriv '(+ x 3 4) 'x)
;Value: 1

(deriv '(+ x x 55) 'x)
;Value: 2

(deriv '(+ (* 3 x) (* 5 x)) 'x)
;Value: 8

(define (multiplicand s)
  (if (pair? (cdddr s))
      (cons '* (cddr s))
      (caddr s)))
;Value: multiplicand

(deriv '(* x y) 'x)
;Value: y

(deriv '(* x y (+ x 3)) 'x)
;Value 16: (+ (* x y) (* y (+ x 3)))


***

(define (augend s) (if (null? (cdddr s))
                       (caddr s)
                       (cons '+ (list (caddr s) (augend (cdr s))))))

(define (multiplicand p) (if (null? (cdddr p))
                             (caddr p)
                             (cons '* (list (caddr p) (multiplicand (cdr p))))))

