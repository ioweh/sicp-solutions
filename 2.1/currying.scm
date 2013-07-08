Copyright (C) 2010 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.

Image saved on Wednesday May 8, 2013 at 12:41:10 PM
  Release 9.0.1 || Microcode 15.1 || Runtime 15.7 || SF 4.41 || LIAR/C 4.118 || Edwin 3.116

;You are in an interaction window of the Edwin editor.
;Type `C-h' for help, or `C-h t' for a tutorial.
;`C-h m' will describe some commands.
;`C-h' means: hold down the Ctrl key and type `h'.
;Package: (user)

(define sum-of-squares
  (lambda (x y) (+ (square x) (square y))))
;Value: sum-of-squares

(sum-of-squares 3 4)
;Value: 25

(define (sum-of-squares x y)
  (+ (square x) (square y)))
;Value: sum-of-squares

(sum-of-squares 3 4)
;Value: 25

((lambda (x y) (+ (square x) (square y))) 2 3)
;Value: 13

((lambda (x y) (+ (square x) (square y))) 3 4)
;Value: 25

(define (f-3 f)
  (lambda (x) (f (f (f x)))))
;Value: f-3

((f-3 square) 2)
;Value: 256

(define (f-n f n)
  (lambda (x)
    (define (iter k)
      (if (< k n)
	  (f (iter (+ k 1)))
	  x))
    (iter 0)))
;Value: f-n

((f-n square 3) 2)
;Value: 256

(square (square (square 2)))
;Value: 256

((f-n square 7) 2)
;Value: 340282366920938463463374607431768211456

(square (square (square (square (square (square (square 2)))))))
;Value: 340282366920938463463374607431768211456

((f-n square 1) 3)
;Value: 9

((f-n (lambda (x) (square (square x))) 1) 3)
;Value: 81

(square (square 3))
;Value: 81

((f-n (lambda (x) (square (square (square x)))) 1) 3)
;Value: 6561

(square (square (square 3)))
;Value: 6561

((f-n (lambda (x) (square (square (square x)))) 2) 3)
;Value: 3433683820292512484657849089281



(square (square (square (square (square (square 3))))))
;Value: 3433683820292512484657849089281

((f-n (lambda (x) (square (square x))) 4) 2)
;Value: 115792089237316195423570985008687907853269984665640564039457584007913129639936

(square (square (square (square (square (square (square (square 2))))))))
;Value: 115792089237316195423570985008687907853269984665640564039457584007913129639936

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))
;Value: average-damp

((average-damp square) 10)
;Value: 55

(define sum-of-squares
  (lambda (x y) (+ (square x) (square y))))
;Value: sum-of-squares

(sum-of-squares 3 4)
;Value: 25

(define sum-of-squares
  (lambda (x) (lambda (y) (+ (square x) (square y)))))
;Value: sum-of-squares

((sum-of-squares 3) 4)
;Value: 25

((lambda (y) (+ (square 3) (square y))) 4)
;Value: 25

(define (add a b)
  (action + a b))
;Value: add

(define (mul a b)
  (action * a b))
;Value: mul

(define (action kind a b)
  (kind a b))
;Value: action

(add 2 3)
;Value: 5

(mul 2 3)
;Value: 6

(add 2 3)

(action + 2 3)

(+ 2 3)
;Value: 5

(mul 2 3)

(action * 2 3)

(* 2 3)
;Value: 6

(define add-curried
  (lambda (x) (lambda (y) ((lambda (kind) (action kind x y)) +))))
;Value: add-curried

(add-curried 2)
;Value 6: #[compound-procedure 6]

((add-curried 2) 3)
;Value: 5

(define add-curried
  (lambda (x y) ((lambda (kind) (action kind x y)) +)))
;Value: add-curried

(add-curried 2 3)
;Value: 5

(define (action kind a b c)
  (kind a b c))
;Value: action

(add-curried 2 3 4)

(define (action kind)
  (lambda (a b)
    (kind a b)))
;Value: action

(define add-curried
  ((lambda (kind) (action kind)) +))
;Value: add-curried



(add-curried 2 3)
;Value: 5

(((lambda (kind) (action kind)) +) 2 3)
;Value: 5

((action +) 2 3)
;Value: 5

((lambda (a b) (+ a b)) 2 3)
;Value: 5

(+ 2 3)
;Value: 5

(define (action kind)
  (lambda (a b c)
    (kind a b c)))
;Value: action

((lambda (a b c) (+ a b c)) 2 3 4)
;Value: 9

((action +) 2 3 4)
;Value: 9

(((lambda (kind) (action kind)) +) 2 3 4)
;Value: 9

(add-curried 2 3 4)
;Value: 9



add-curried needs to be evaluated again, but the code need not be chaned




(define (action kind)
  (lambda (a b)
    (kind a b)))
;Value: action

(define add
  (action +))
;Value: add

;Value: add

(add 2 3)
;Value: 5

(add 2 3)

((action +) 2 3)
;Value: 5

((lambda (a b) (+ a b)) 2 3)
;Value: 5

(+ 2 3)
;Value: 5

(define (action kind)
  (lambda (a b c d)
    (kind a b c d)))
;Value: action

(add 2 3 4 5)
;Value: 14

