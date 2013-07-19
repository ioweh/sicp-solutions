
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))
;Value: fold-left


(fold-left cons () (list 1 2 3 4))
;Value 5: ((((() . 1) . 2) . 3) . 4)

This procedure combines the last element of the sequence with the result
of combining all the elements to the left.

(fold-right / 1 (list 1 2 3))

fold-right
;Value 6: #[compiled-procedure 6 ("list" #x79) #x3 #x4a4f3]

(fold-right / 1 (list 1 2 3))

I guess it's 1.5

(fold-right / 1 (list 1 2 3))
;Value: 3/2

(fold-left / 1 (list 1 2 3))

I guess it's 1/6

(fold-left / 1 (list 1 2 3))
;Value: 1/6


(fold-right list () (list 1 2 3))

I guess it's (1 (2 (3 ())))

(fold-right list () (list 1 2 3))
;Value 9: (1 (2 (3 ())))


(fold-left list nil (list 1 2 3))

I guess it's (((() 1) 2) 3)

(fold-left list () (list 1 2 3))
;Value 11: (((() 1) 2) 3)

The operation op must hold the commutative property, i.e. changing the order of the operands does not change the result.
+ is a good candidate for it. Let's try

(fold-right + 0 (list 1 2 3))
;Value: 6

(fold-left + 0 (list 1 2 3))
;Value: 6

 


