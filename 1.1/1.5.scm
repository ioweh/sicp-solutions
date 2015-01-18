(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

In the case of applicative-order evaluation both of the arguments will be evaluated. So the program will never stop executing. While in the case of normal-order evaluation, the program will be executing in the following order:

(if (= 0 0)
    0
    (p))

as we clearly remember, 'if' is the special form, so the second argument will not be evaluated, saving us money spent on the energy for the computer running the program.