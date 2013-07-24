
(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ 1 low) high))))
;Value: enumerate-interval

(enumerate-interval 1 6)
;Value 3: (1 2 3 4 5 6)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(accumulate + 0 (list 1 3 4))
;Value: 8

(define (flatmap proc seq)
  (accumulate append
	      ()
	      (map proc seq)))
;Value: flatmap

(define (ordered-triples n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
			(map (lambda (k) (list i j k))
			     (enumerate-interval 1 (- j 1))))
		      (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))
;Value: ordered-triples

(ordered-triples 6)
;Value 4: ((3 2 1) (4 2 1) (4 3 1) (4 3 2) (5 2 1) (5 3 1) (5 3 2) (5 4 1) (5 4 2) (5 4 3) (6 2 1) (6 3 1) (6 3 2) (6 4 1) (6 4 2) (6 4 3) (6 5 1) (6 5 2) (6 5 3) (6 5 4))

(define (triples-with-sum s n)
  (filter (lambda (triple)
	    (= (accumulate + 0 triple) s))
	  (ordered-triples n)))
;Value: triples-with-sum

(triples-with-sum 6 4)
;Value 5: ((3 2 1))

(triples-with-sum 10 5)
;Value 6: ((5 3 2) (5 4 1))

(triples-with-sum 12 12)
;Value 7: ((5 4 3) (6 4 2) (6 5 1) (7 3 2) (7 4 1) (8 3 1) (9 2 1))

