
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(accumulate + 0 (list 1 2 3 4 5))
;Value: 15

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) () sequence))
;Value: map

(map square (list 1 2 3 4 5))
;Value 5: (1 4 9 16 25)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
;Value: append

(append (list 1 2 3) (list 4 5 6))
;Value 6: (1 2 3 4 5 6)

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
;Value: length

(length (list 1 2 3 4 5))
;Value: 5

