

(1 (2 (3 (4))))

(list 1 (list 2 (list 3 (list 4))))
;Value 7: (1 (2 (3 (4))))

(cons 1
      (cons 2
	    (cons 3
		  (cons 4 ()))))
;Value 8: (1 2 3 4)

Since list is defined as 

(cons <a1> (cons <a2> (cons ... (cons <an> nil) ...)))

adding any parentheses would change the list's structure, like


(list 3 (list 4))
;Value 12: (3 (4))

(list 3 (cons 4 ()))
;Value 13: (3 (4))

(cons 3
      (cons (cons 4 ()) ()))
;Value 16: (3 (4))

It follows from the definition of a list.

(list 1 (list 2 (list 3 4))) -> (cons 1 (cons (cons 2 (cons (cons 3 4) ())) ()))

(1 (2 (3 4)))

(list 1 (list 2 (list 3 4)))
;Value 17: (1 (2 (3 4)))

