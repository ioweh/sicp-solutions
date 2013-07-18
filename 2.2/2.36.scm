
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(accumulate cons () (list 1 2 3 4 5))
;Value 3: (1 2 3 4 5)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      ()
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))
;Value: accumulate-n

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
;Value: s

s
;Value 4: ((1 2 3) (4 5 6) (7 8 9) (10 11 12))

(accumulate-n + 0 s)
;Value 5: (22 26 30)

