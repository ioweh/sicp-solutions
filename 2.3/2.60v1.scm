
;https://en.wikipedia.org/wiki/Multiset

(define (element-of-usual-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-usual-set? x (cdr set)))))
;Value: element-of-usual-set?

(define (element-of-multiset? x set)
  (define (make-element-of-x-size x set)
    (if (null? x)
	'()
	(cons (car set)
	      (make-element-of-x-size (cdr x) (cdr set)))))
  (cond ((> (length x) (length set)) false)
	((equal? x (make-element-of-x-size x set)) true)
	(else (element-of-multiset? x (cdr set)))))
;Value: element-of-multiset?



(define (element-of-set? x set)
  (if (pair? x)
      (element-of-multiset? x set)
      (element-of-usual-set? x set)))
;Value: element-of-set?

(element-of-set? '1 '(2 1 3))
;Value: #t

(element-of-set? '3 '(2 4 54))
;Value: #f

(element-of-set? '(1 2) '(8 4 1 2 6))
;Value: #t

(element-of-set? '(1 3) '(8 4 1 2 6))
;Value: #f

(element-of-set? '(8 4 1 2 6) '(8 4 1 2 6))
;Value: #t

(element-of-set? '(1 2 3) '(1))
;Value: #f

(define (adjoin-set x set)
  (define (add-sets set1 set2)
    (if (null? set1)
	set2
	(cons (car set1)
	      (add-sets (cdr set1) set2))))
  (if (element-of-set? x set)
      set
      (add-sets x set)))
;Value: adjoin-set

(adjoin-set '(1 1) '(1 1 2))
;Value 14: (1 1 2)

(adjoin-set '(1 1) '(1 2))
;Value 15: (1 1 1 2)

(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((element-of-set? set1 set2)
	 (union-set (cdr set1) set2))
	(else (cons (car set1)
		    (union-set (cdr set1) set2)))))
;Value: union-set

(union-set '(1 1) '(1 2))
;Value 18: (1 1 2)

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))
;Value: intersection-set

(intersection-set '(1 1 1 3) '(1 1 2))
;Value 19: (1 1 1)




