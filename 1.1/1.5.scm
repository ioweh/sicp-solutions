(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

Well

(test 0 (p))

If the interpreter uses applicative-order evaluation, the arguments will be evaluated first and then the operand will be applied to the expression. Zero will evaluate to zero and (p) will call itself recursively without a stop. So it will never halt.

In case of normal-order evaluation the expressions will be fully expanded and only then the arguments will be evaluated. In our case it will look like this:

(test 0 (p))

(if (= 0 0)
    0
    (p))

The result will be zero.