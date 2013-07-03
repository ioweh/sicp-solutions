
(define (f g)
  (g 2))
;Value: f

(f square)
;Value: 4

(f (lambda (z) (* z (+ z 1))))
;Value: 6

Our interpreter uses an applicative-order evaluation:

(f f)

f is passed as a parameter to the function f and needs to be estimated, f itself is a procedure.

The interpreter evaluates the address of the procedure and calls f

(f 2)

(2 2)

The object 2 is not a procedure and is not applicable.