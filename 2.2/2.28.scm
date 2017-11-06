
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
;Value: length


We could use cons in order to combine the results of appending lists.

(define (my-append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
	    (append (cdr list1) list2))))
;Value: my-append

If car is a list we need to append it, else we need to cons it.


If (car items) is not a pair

(cons (car items)
      (fringe (cdr items)))

If (car items) is a list

(append (fringe (car items))
	(fringe (cdr items)))

If items is null

items

(define (fringe items)
  (cond ((null? items) items)
	((not (pair? (car items)))
	 (cons (car items)
	       (fringe (cdr items))))
	((list? (car items))
	 (append (fringe (car items))
		 (fringe (cdr items))))))
;Value: fringe

(fringe (list 1 2))
;Value 10: (1 2)

(fringe (list 1 2 3 4 5))
;Value 11: (1 2 3 4 5)

(fringe (list (list 1 2) 3 4 5))
;Value 12: (1 2 3 4 5)

(fringe (list (list 1 2) (list 3 4)))
;Value 13: (1 2 3 4)

(define x (list (list 1 2) (list 3 4)))
;Value: x

x
;Value 14: ((1 2) (3 4))

(fringe x)
;Value 15: (1 2 3 4)

(fringe (list (list 1 2 3 4) (list 5 6) 7 8 9 (list (list 10 11) 12)))
;Value 16: (1 2 3 4 5 6 7 8 9 10 11 12)


***

; The most appropriate strategy is to apply wishful thinking here: we assume that the procedure fringe already works as expected and start constructing the algorithm from there.


(define x (list (list 1 2) (list 3 4)))
;Value: x

(define (fringe items)
  (cond ((null? items) ())
	((pair? (car items)) (append (fringe (car items)) (fringe (cdr items))))
	(else (cons (car items) (fringe (cdr items))))))
;Value: fringe

(fringe x)
;Value 12: (1 2 3 4)

x
;Value 13: ((1 2) (3 4))
