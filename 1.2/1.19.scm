Tpq:
a <- bq + aq + ap
b <- bp + aq

1. a <- b + a
   b <- a

2. a <- (b + a) + a
   b <- (b + a)

Use a single transformation Tp'q'

p' <- q'q + p'q + p'p
q' <- q'p + p'q

***

Update: the coefficients should be:

(+ (* p p) (* q q))     ; compute p'
(+ (* 2 p q) (* q q))   ; compute q'

