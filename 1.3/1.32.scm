
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))
;Value: accumulate

(define (sum term a next b)
  (accumulate + 0 term a next b))
;Value: sum

(define (product term a next b)
  (accumulate * 1 term a next b))
;Value: product

(define (inc a) (+ a 1))
;Value: inc

(define (identity a) a)
;Value: identity

(sum identity 1 inc 4)
;Value: 10

(product identity 1 inc 4)
;Value: 24

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner (term a) result))))
  (iter a null-value))


