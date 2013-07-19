
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate


(define (dot-product v w)
  (accumulate + 0 (map * v w)))
;Value: dot-product

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product v row)) m))
;Value: matrix-*-vector



(map * (list 1 2) (list 3 4))
;Value 3: (3 8)

(dot-product (list 1 2) (list 3 4))
;Value: 11

(dot-product (list 3 4) (list 1 2))
;Value: 11


(matrix-*-vector (list (list 1 2 3) (list 4 5 6)) (list 1 2 3))
;Value 5: (14 32)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      ()
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))
;Value: accumulate-n

(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
;Value 6: (22 26 30)

(define (transpose mat)
  (accumulate-n cons () mat))
;Value: transpose

(transpose (list (list 1 2 3) (list 4 5 6)))
;Value 7: ((1 4) (2 5) (3 6))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m-row)
	   (matrix-*-vector cols m-row))
	 m)))
;Value: matrix-*-matrix


(matrix-*-matrix (list (list 0 1) (list 0 0)) (list (list 0 1) (list 0 0)))
;Value 11: ((0 0) (0 0))





