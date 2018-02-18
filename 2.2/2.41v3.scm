
(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
	  sequence))
;Value: remove

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))))
;Value: enumerate-interval

(enumerate-interval 2 7)
;Value 12: (2 3 4 5 6 7)

(define (chain xs)
  (if (< (length xs) 3)
      ()
      (cons (list (car xs) (cadr xs) (last xs))
	    (chain (remove (cadr xs) xs)))))
;Value: chain

(chain (enumerate-interval 1 5))
;Value 13: ((1 2 5) (1 3 5) (1 4 5))

(define (combinations nx)
  (if (null? nx)
      ()
      (append (chain nx)
	      (combinations (cdr nx)))))
;Value: combinations

(combinations (enumerate-interval 1 5))
;Value 14: ((1 2 5) (1 3 5) (1 4 5) (2 3 5) (2 4 5) (3 4 5))

(define (ordered-triples ns)
  (if (null? ns)
      ()
      (append (combinations ns)
	      (ordered-triples (remove (last ns) ns)))))
;Value: ordered-triples

(ordered-triples (enumerate-interval 1 5))
;Value 15: ((1 2 5) (1 3 5) (1 4 5) (2 3 5) (2 4 5) (3 4 5) (1 2 4) (1 3 4) (2 3 4) (1 2 3))


(define (sum-ordered-triples n s)
  (filter (lambda (x) (= (+ (car x) (cadr x) (caddr x)) s))
	  (ordered-triples (enumerate-interval 1 n))))
;Value: sum-ordered-triples

(sum-ordered-triples 5 8)
;Value 20: ((1 2 5) (1 3 4))
