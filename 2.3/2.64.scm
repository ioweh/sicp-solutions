

Magically the helper procedure partial-tree takes as arguments an integer n and a list
of at least n elements and 

*constructs a balanced tree containing the first n elements of the list.*

(I cannot emphasize more) We could exploit this fact in constructing the procedure, but let's first call it.

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
;Value: list->tree

The result returned by partial-tree is a pair (formed with cons) whose car is the constructed tree
and whose cdr is the list of elements not included in the tree.

Then we need to split the list passed in as a parameter into three parts, exactly:

left-tree, which is the result of applying the procedure partial-tree to the left side of the list

this-entry, which is the central node of the newly constructed tree

right-tree, which is the right part of the list

It seems logical to estimate the number of the elements in different parts of the list 
with the following procedures

(define left-size (quotient (- n 1) 2))

When applied to a list, it will remove the future entry of the tree and break the list into halves.

(define right-size (- n (+ left-size 1)))

Here we just add the entry of the list to the amount of the nodes of the left branch of the list
and subtract this result from the overall amount of nodes in the wannabe tree.

Consider this list

'(1 3 5 7 9 11)

The length of the list is 6. The left-size is 2 and the right size is 3 elements.

The following figure is starting to appear

    .
   / \
   \ /\

This is how the future tree will be formed.

Now let's go on. The (left-result (partial-tree elts left-size)) is a pair whose car is the constructed tree
for the left part and whose cdr is the list of elements not included in the left part of the tree.

Clearly from here, the left-tree is the (car left-result) and we proceed to work with the rest of the elements,
which are (cdr (left-result)), i.e. non-left-elts. this-entry is (car non-left-elts). And right-result is
(partial-tree (cdr non-left-elts) right-size). right-tree is (car right-result) and remaining-elts is (cdr righ-result),
in case if n is less than the actual number of elements. We can now construct the overall result, which is

(cons (make-tree this-entry left-tree right-tree)
      remaining-elts)

In the border cases, when n is zero, we return an empty list with the rest of the elements.

Our list will look as follows

(list->tree '(1 3 5 7 9 11))

      5
     / \
    1   \
     \   \
      3   9
         / \
        7   11

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
;Value: list->tree

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
	(let ((left-result (partial-tree elts left-size)))
	  (let ((left-tree (car left-result))
		(non-left-elts (cdr left-result))
		(right-size (- n (+ left-size 1))))
	    (let ((this-entry (car non-left-elts))
		  (right-result (partial-tree (cdr non-left-elts)
					      right-size)))
	      (let ((right-tree (car right-result))
		    (remaining-elts (cdr right-result)))
		(cons (make-tree this-entry left-tree right-tree)
		      remaining-elts))))))))
;Value: partial-tree

(define (make-tree entry left-branch right-branch)
  (list entry left-branch right-branch))
;Value: make-tree


(list->tree '(1 3 5 7 9 11))
;Value 4: (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

Regarding the order of growth... My opinion is it's just O(n) as the procedure will call cons for every node of the tree.
