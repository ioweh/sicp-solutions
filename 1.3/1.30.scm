
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ (term a) result))))
  (iter a 0))
;Value: sum

(define (cube x) (* x x x))
;Value: cube

(define (inc n) (+ n 1))
;Value: inc

(define (sum-cubes a b)
  (sum cube a inc b))
;Value: sum-cubes

(sum-cubes 1 10)
;Value: 3025

