
equal?
;Value 2: #[compiled-procedure 2 ("equals" #x2) #x3 #x4af06]

(define (myequal? list1 list2)
  (cond ((and (null? list1) (null? list2))
	 true)
	((or (null? list1) (null? list2))
	 false)
	((and (pair? list1) (pair? list2)
	      (myequal? (car list1) (car list2))
	      (myequal? (cdr list1) (cdr list2)))
	 true)
	((or (pair? list1) (pair? list2))
	 false)
	(else
	 (eq? list1 list2))))
;Value: myequal?

(myequal? '(this is a list) '(this is a list))
;Value: #t

(myequal? '(this (is a) list) '(this (is a) list))
;Value: #t

(myequal? '(this list ends here) '(this list ends))
;Value: #f

(myequal? '() '())
;Value: #t

(myequal? '(this is a list) '(this is the list))
;Value: #f

(myequal? '(this is a list) '(this (is a) list))
;Value: #f

