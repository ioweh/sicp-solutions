

(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))
;Value: element-of-set?

(define (adjoin-set x set)
  (cons x set))
;Value: adjoin-set

(define (union-set set1 set2)
  (append set1 set2))
;Value: union-set

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))
;Value: intersection-set

;(element-of-set? x set) -> O(n)
;(adjoin-set x set) -> 0(1)
;(union-set set1 set2) -> O(n)
;(intersection-set set1 set2) -> O(n^2)

;I'd use this representation for those cases when adjoin-set and union-set are used most.

