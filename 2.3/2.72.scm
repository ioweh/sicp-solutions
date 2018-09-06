
Let's consider the special case where the relative frequences of the n symbols 
are as described in exercise 2.71. Now, in the best case, we'll always get 
the most frequent symbol. In this case, its search will be performed 
in O(1) steps. We also include the number of steps needed to search the symbol list 
at each node encountered. In this case, it has also O(1) order of growth.
O(1)* O(1) is O(1) still, so the whole process of searching the element in the tree 
and searching it in the list of symbols will have O(1) order of growth. 
Not so with the worst case, when we search for the least frequent element.
Its search will have O(n) order of growth. And determining if the element 
belongs to the list of symbols will also have O(n) growth. So, the whole process will have 
O(n)*O(n), which is O(n^2) order of growth.

***

Here, at the very first check for the most frequent symbol, we still have to check all the symbols in the left branch of the tree, even though the symbol is not there. So we have to make exactly n steps here, which is why the order of growth is O(n) in this case. Of course, this would happen only when the left branch is checked before the right branch. If we were luck enough to check the right branch first, the complexity would be O(1).
