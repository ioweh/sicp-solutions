
(define (union-set set1 set2)
  (if (null? set1)
      set2
      (if (null? set2)
	  set1
	  (let ((x1 (car set1)) (x2 (car set2)))
	    (cond ((= x1 x2)
		   (cons x1
			 (union-set (cdr set1)
				    (cdr set2))))
		  ((< x1 x2)
		   (cons x1
			 (union-set (cdr set1)
				    set2)))
		  ((< x2 x1)
		   (cons x2
			 (union-set set1
				    (cdr set2)))))))))
;Value: union-set

(union-set '(1 2 3) '(2 3 4 5))
;Value 3: (1 2 3 4 5)

(union-set '(8 9 10) '(2 3 4))
;Value 4: (2 3 4 8 9 10)

      