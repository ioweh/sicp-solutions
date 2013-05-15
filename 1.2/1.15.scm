
(define (cube x) (* x x x))
;Value: cube

(define (p x) (- (* 3 x) (* 4 (cube x))))
;Value: p

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
;Value: sine

(sine 12.15)
;Value: -.39980345741334

;a. The procedure is applied 5 times when (sine 12.15) is evaluated.

;(sine 12.15) -> (sine 4.05) -> (sine 1.35) -> (sine 0.45) -> (sine 0.15) -> (sine 0.05)

;b. a/(3^n)<0.1

number of steps is n

3^n>10a

n>log3(10a)

number of steps grows logarithmically

space grows logarithmically, as space grows proportionally to the number of steps

