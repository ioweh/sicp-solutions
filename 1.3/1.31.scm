
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))
;Value: product

(define (inc a) (+ a 1))
;Value: inc

(define (identity x) x)
;Value: identity

(define (factorial n)
  (product identity 1 inc n))
;Value: factorial

(factorial 6)
;Value: 720

(* 1 2 3 4 5 6)
;Value: 720

(define (pi-app)
  (define (inc n) (+ n 2))
  (define (pi-mul n)
    (/ (* (- n 1) (+ n 1)) (* n n)))
  (product pi-mul 3 inc 1000))
;Value: pi-app

(* (pi-app) 1.0)
;Value: .7857909606047995


(/ 3.14 4)
;Value: .785

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* (term a) result))))
  (iter a 1))
;Value: product

(* (pi-app) 1.0)
;Value: .7857909606047995


