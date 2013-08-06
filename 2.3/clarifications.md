
(define (make-tree entry left-branch right-branch)
  (list entry left-branch right-branch))
;Value: make-tree

(define entry car)
;Value: entry

(define left-branch cadr)
;Value: left-branch

(define right-branch caddr)
;Value: right-branch

(define (element-of-tree? x tree)
  (cond ((null? tree) false)
	((= x (entry tree)) true)
	((> x (entry tree))
	 (element-of-tree? x (right-branch tree)))
	((< x (entry tree))
	 (element-of-tree? x (left-branch tree)))))
;Value: element-of-tree?


(define (adjoin-element x tree)
  (cond ((null? tree) (make-tree x '() '()))
	((= x (entry tree)) tree)
	((> x (entry tree))
	 (make-tree (entry tree)
		    (left-branch tree)
		    (adjoin-element x (right-branch tree))))
	((< x (entry tree))
	 (make-tree (entry tree)
		    (adjoin-element x (left-branch tree))
		    (right-branch tree)))))
;Value: adjoin-element


(define mytree '())
;Value: mytree

(define mytree (adjoin-element 3 mytree))
;Value: mytree

(define mytree (adjoin-element 11 mytree))
;Value: mytree

(define mytree (adjoin-element 7 mytree))
;Value: mytree

(define mytree (adjoin-element 5 mytree))
;Value: mytree

mytree
;Value 11: (3 () (11 (7 (5 () ()) ()) ()))

(define mytree (adjoin-element 9 mytree))
;Value: mytree

mytree
;Value 12: (3 () (11 (7 (5 () ()) (9 () ())) ()))

(define mytree (adjoin-element 1 mytree))
;Value: mytree

mytree
;Value 13: (3 (1 () ()) (11 (7 (5 () ()) (9 () ())) ()))

(define (tree->list tree)
  (cond ...
	

Suppose we already got the list for the right branch. We need to cons it to the entry like that:

(cons (entry tree)
      list-for-the-right-branch)

Then we need to append this result to the entry for the left branch of the tree.

(append list-for-the-left-branch
	(cons (entry tree)
	      list-for-the-right-branch))

But as we already know that this procedure turns a tree into a list, we can substitute the 
'list-for-the-left-branch' and 'list-for-the-right-branch' with it.

(append (tree->list (left-branch tree))
	(cons (entry tree)
	      (tree->list (right-branch tree))))

When the reach the end nodes we return empty lists. So, the whole procedure will look as follows.

(define (tree->list-1 tree)
  (cond ((null? tree) '())
	(else (append (tree->list-1 (left-branch tree))
		      (cons (entry tree)
			    (tree->list-1 (right-branch tree)))))))
;Value: tree->list-1

(tree->list-1 mytree)
;Value 16: (1 3 5 7 9 11)

We can also use a different approach.

Wishful thinking! We already have a list for the right branch of the tree. Let's call it result.

We need to cons this result to the entry node of the tree.

(cons (entry tree)
      result)

Let's imagine that we already have the procedure that transforms a tree into a list by damn magic.

(krible-krable-bums! tree '())

(define (krible-krable-bums! tree result)
  (krible-krable-bums! (left-branch tree)
		       (cons (entry tree)
			     (krible-krable-bums! (right-branch tree)
						  result))))



