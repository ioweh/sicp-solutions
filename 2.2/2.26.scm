
Let's remember how append was implemented

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
;Value: append

(define odds (list 1 3 5 7))
;Value: odds

odds
;Value 3: (1 3 5 7)

(define squares (list 1 4 9 16 25))
;Value: squares

(append odds squares)
;Value 4: (1 3 5 7 1 4 9 16 25)

Now let's get back to the exercise

(define x (list 1 2 3))
;Value: x

x
;Value 5: (1 2 3)

(define y (list 4 5 6))
;Value: y

y
;Value 6: (4 5 6)

(append x y)

(1 2 3 4 5 6)

(append x y)
;Value 7: (1 2 3 4 5 6)

(cons x y)

((1 2 3) 4 5 6)

(cons x y)
;Value 8: ((1 2 3) 4 5 6)

(list x y)

((1 2 3) (4 5 6))

(list x y)
;Value 9: ((1 2 3) (4 5 6))

