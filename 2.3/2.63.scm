
;The two procedures produce the same result for every tree. However, the results differ in a number of steps.

(define (entry tree) (car tree))
;Value: entry

(define (left-branch tree) (cadr tree))
;Value: left-branch

(define (right-branch tree) (caddr tree))
;Value: right-branch

(define (make-tree entry left right)
  (list entry left right))
;Value: make-tree

(define (element-of-set? x set)
  (cond ((null? set) false)
	((= x (entry set)) true)
	((< x (entry set))
	 (element-of-set? x (letf-branch set)))
	((> x (entry set))
	 (element-of-set? x (right-branch set)))))
;Value: element-of-set?

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
	((= x (entry set)) set)
	((< x (entry set))
	 (make-tree (entry set)
		    (adjoin-set x (left-branch set))
		    (right-branch set)))
	((> x (entry set))
	 (make-tree (entry set)
		    (left-branch set)
		    (adjoin-set x (right-branch set))))))
;Value: adjoin-set

(define mytree '())
;Value: mytree

(define mytree (adjoin-set 8 mytree))
;Value: mytree

(define mytree (adjoin-set 10 mytree))
;Value: mytree

(define mytree (adjoin-set 3 mytree))
;Value: mytree

(define mytree (adjoin-set 1 mytree))
;Value: mytree

(define mytree (adjoin-set 6 mytree))
;Value: mytree

(define mytree (adjoin-set 4 mytree))
;Value: mytree

(define mytree (adjoin-set 7 mytree))
;Value: mytree

(define mytree (adjoin-set 14 mytree))
;Value: mytree

(define mytree (adjoin-set 13 mytree))
;Value: mytree

mytree
;Value 9: (8 (3 (1 () ()) (6 (4 () ()) (7 () ()))) (10 () (14 (13 () ()) ())))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
	      (cons (entry tree)
		    (tree->list-1 (right-branch tree))))))
;Value: tree->list-1


(tree->list-1 mytree)
;Value 13: (1 3 4 6 7 8 10 13 14)

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list (right-branch tree)
					  result-list)))))
  (copy-to-list tree '()))
;Value: tree->list-2

(tree->list-2 mytree)
;Value 14: (1 3 4 6 7 8 10 13 14)

;a. Result for the first tree in figure 2.16 is (1 3 5 7 9 11). The same goes for the other two.
;b. The first procedure grows more slowly as it uses append in order to convert a tree to a list.
; Actually, the first procedure completes the task in exponential number of steps, because
; it calls itself twice on each step of computation. The second procedure requires the 
; linear number of steps.
; Fix: We assume that cons is a constant-time operation. The second procedure calls cons at each step.
; So, the tree->list-2 procedure has a time complexity of O(n).
; The first procedure calls append at each step. The order of growth of append is proportional to
; the first list that's passed in. In the case of tree->list-1, the first list argument is the left branch
; of the tree, which is a bout half of a node's elements for a balanced tree. This means that for each
; recursive call, approximately half of the number of nodes will be in the first list argument as in the
; previous call. Since the number of elements is cut in half on each of the n calls to append,
; the tree->list-1 procedure has a complexity of O(n log n) for a balanced tree.


***

The overall height of the tree, assuming that the tree is balanced and the number of nodes is halved at each algorithm step, is log2 n. At the same time, the number of steps at each level is proportional to the number of steps of the append procedure. Considering the two nodes one level down from the top node, it's possible to estimate that the number of steps at each node is (n/2)/2, as we assume that the tree is balanced and each subtree contains half of the nodes of the upper node, noted as n here (and the append procedure runs the cons operations only on the left subtree). And, as there are two branches, the overall amount of steps is still n/2, the same with the amount of steps at the top level. The same assumptions are valid for all the following levels in the tree, and each level requires exactly n/2 steps. Thus, to estimate the order of growth of the whole procedure, we multiply n/2 by log2 n - a total number of steps, which gives O(n) = n * log n.

