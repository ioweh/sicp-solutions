
Clearly, we don't care what is the order of the elements we feed into the procedure list->tree
from the 2.64 exercise as long as it produces the balanced tree. We can use it on any list we want.

However, if we apply this procedure on an unordered list and then use the procedure tree->list from
the exercise 2.63, the list will be unordered.

But let's assume that the set has already been implemented as a balanced binary tree. The procedure that made this tree
has already took an ordered list as its input parameter.

We have to convert this tree into a list using the results of the exercise 2.63. It will take O(n) steps
(in case if we use the second implementation of tree->list).

Then, as we always get orderes lists as an output of this procedure, we can apply to them procedures union-set and
intersection-set implemented earlier for ordered lists. Those procedures take O(n) growth. Remembering that O(n) + O(n)
is still O(n), we can use them as O(n) implementations of union-set and intersection set for sets
implemented as balanced binary trees.

Of course, we don't forget to turn ordered lists back to balanced binary trees using the procedure from exercise 2.64,
which also has O(n) growth.

(define (union-set-tree set1 set2)
  (list->tree (union-set (tree->list set1)
			 (tree->list set2))))

(define (intersection-set-tree set1 set2)
  (list->tree (intersection-set (tree->list set1)
				(tree->list set2))))
