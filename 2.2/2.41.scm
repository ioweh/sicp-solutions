
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(accumulate cons () (list 1 2 3 4))
;Value 3: (1 2 3 4)

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))))
;Value: enumerate-interval

(enumerate-interval 1 6)
;Value 4: (1 2 3 4 5 6)

(define (flatmap proc seq)
  (accumulate append
	      ()
	      (map proc seq)))
;Value: flatmap

(define (unique-pairs r)
  (flatmap (lambda (i)
	     (map (lambda (j) (list i j))
		  (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 r)))
;Value: unique-pairs

(unique-pairs 4)
;Value 6: ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3))

(define (unique-triples s)
  (flatmap (lambda (i)
	     (map (lambda (j) (cons i j))
		  (unique-pairs (- i 1))))
	   (enumerate-interval 1 s)))
;Value: unique-triples


(unique-triples 4)
;Value 8: ((3 2 1) (4 2 1) (4 3 1) (4 3 2))

(unique-triples 5)
;Value 9: ((3 2 1) (4 2 1) (4 3 1) (4 3 2) (5 2 1) (5 3 1) (5 3 2) (5 4 1) (5 4 2) (5 4 3))

(define (sum-less-than-s? s items)
  (or (= (+ (car items) (cadr items) (caddr items)) s)
      (< (+ (car items) (cadr items) (caddr items)) s)))
;Value: sum-less-than-s?


(define (triples s)
  (filter (lambda (x) (sum-less-than-s? s x))
	  (unique-triples s)))
;Value: triples

(triples 5)
;Value: ()


(triples 6)
;Value 12: ((3 2 1))

(triples 7)
;Value 13: ((3 2 1) (4 2 1))

(triples 10)
;Value 14: ((3 2 1) (4 2 1) (4 3 1) (4 3 2) (5 2 1) (5 3 1) (5 3 2) (5 4 1) (6 2 1) (6 3 1) (7 2 1))


***

- probably we should leave only test for equality in the sum-less-than-s? procedure

