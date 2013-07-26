
Because now the program is calling the queen-cols procedure for each number in the interval [1..board-size]. Poor Louis.

Let's estimate how the time increases with each step.

1 - > (queen-cols (- k 1))
2 - > (queen-cols (- k 1))
3 - > (queen-cols (- k 1))
4 - > (queen-cols (- k 1))
5 - > (queen-cols (- k 1))
6 - > (queen-cols (- k 1))
7 - > (queen-cols (- k 1))
8 - > (queen-cols (- k 1))

Each of (queen-cols (- k 1)) starts the very same process as above. This is a tree-recursive process, which grows exponentially with board-size.

Tnew = T^board-size



