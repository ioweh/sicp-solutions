
Obviously, the lookup procedure will perform in a logarithmic number of steps, if we structure the set of records as a binary tree.
Let's assume we have simple keys, implemented as integers. Then the lookup procedure will look so

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
	((= given-key (key (entry set-of-records)))
	 (entry set-of-records))
	((< given-key (key (entry set-of-records)))
	 (lookup given-key (left-branch set-of-records)))
	((> given-key (key (entry set-of-records)))
	 (lookup given-key (right-branch set-of-records)))))
;Value: lookup

(define tree-db '((2 . Joe) ((1 . Bill) () ()) ((3 . Frank) () ((4 . John) () ()))))
;Value: tree-db

(define entry car)
;Value: entry

(define left-branch cadr)
;Value: left-branch

(define right-branch caddr)
;Value: right-branch

(define (make-tree entry left-branch right-branch)
  (list entry left-branch right-branch))
;Value: make-tree

(lookup 3 tree-db)
;Unbound variable: key
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of key.
; (RESTART 2) => Define key to a given value.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(define key car)
;Value: key

(lookup 3 tree-db)
;Value 4: (3 . frank)

