1)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) (* guess 0.001)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

See this community wiki post for details:

http://community.schemewiki.org/?sicp-ex-1.7

"Just using 0.001 is, in effect, doing the same thing as the original program. It basically says 'If the difference between this guess and improved guess is less than 0.0001 in absolute terms (as opposed to percent terms) then stop improving.'  Problem with this is that for really tiny numbers, it is easy for the total difference between guess and improve guess to be less than .0001 and for the program to stop without actually doing anything. For large numbers, it might take forever to get to where guess and improved guess are less than .0001. So the book asks us to stop the program if improved guess is less than a certain PERCENT of guess. And THAT is what this alternative does."

2)

(load "newton-raphson.scm")
;Loading "newton-raphson.scm"... done
;Value: sqrt

(sqrt 2)
;Value: 1.4142156862745097

(define (sqrt x)
  (sqrt-iter 1.0 (improve 1.0 x) x))
;Value: sqrt

(define (sqrt-iter guess newguess x)
  (if (good-enough? guess newguess x)
      guess
      (sqrt-iter newguess
		 (improve newguess x)
		 x)))
;Value: sqrt-iter

(define (good-enough? guess newguess x)
  (< (/ (abs (- guess newguess)) guess) 0.001))

(sqrt 2)
;Value: 1.4142156862745097


If x is set close to 0.001 and lower, the difference between (square guess) and x can be significant in terms of these numbers. But this difference will be less than the predetermined tolerance still.

For big numbers, if the precision is limited, the guess (that will be large enough) can not converge to the right value, but rather move around it eternally, if the errors related to limited precision exceed the value of 0.001 that we set initially.

All of this will be fixed if we monitor the guess and stop the procedure when it changes very slightly, meaning that the difference between the old guess and a new one will be just some small part of the guess.
