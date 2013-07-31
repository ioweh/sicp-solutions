
We suppose that the lists to be compared both have the same length.

(define (myequal? list1 list2)
  (cond ((or (null? list1) (null? list2))
	 true)
	((and (symbol? (car list1))
	      (symbol? (car list2))
	      (eq? (car list1) (car list2)))
	 (myequal? (cdr list1) (cdr list2)))
	((and (list? (car list1))
	      (list? (car list2))
	      (myequal? (car list1) (car list2)))
	 (myequal? (cdr list1) (cdr list2)))
	(else false)))
;Value: myequal?

(myequal? '(this is a list) '(this is a list))
;Value: #t


(myequal? '(this is the list) '(this is a list))
;Value: #f

(myequal? '(this (is a) list) '(this (is a) list))
;Value: #t

(myequal? '(this (is a) list) '(this is a list))
;Value: #f





