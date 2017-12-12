
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(accumulate * 1 (list 1 2 3 4 5))
;Value: 120


(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))))))
;Value: count-leaves

(define x (cons (list 1 2) (list 3 4)))
;Value: x

(count-leaves x)
;Value: 4

(length x)
;Value: 3

(define (count-leaves t)
  (accumulate (lambda (x y) (+ x y)) 0 (map (lambda (sub-tree)
					      (cond ((pair? sub-tree)
						     (count-leaves sub-tree))
						    ((null? sub-tree) 0)
						    (else 1)))
					    t)))
;Value: count-leaves



(count-leaves x)
;Value: 4

(count-leaves (list 1 2 3 (list 4 5 6) 7 (list 8 9)))
;Value: 9


***

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves x) 1)) t)))
;Value: count-leaves
