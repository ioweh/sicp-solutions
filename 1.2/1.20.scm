remainder
;Value 2: #[compiled-procedure 2 ("arith" #xfc) #x3 #x35621]

(gcd 206 40)

In normal-order evaluation the interpreter wouldn't evaluate the operands until their values were needed.

(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))


(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0) ;; 1 remainder evaluated
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))


(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0) ;; 2 remainders evaluated
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))


(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ;; 4 remainders evaluated
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder (206 40) (remainder 40 (remainder 206 40)))))))


(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder (206 40) (remainder 40 (remainder 206 40))))))

(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder (206 40) (remainder 40 (remainder 206 40))))) 0) ;; 7 remainders evaluated
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder (206 40) (remainder 40 (remainder 206 40))))) (remainder (remainder (remainer 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder (206 40) (remainder 40 (remainder 206 40))))))))

(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ;; 4 remainders evaluated

18 remainder operations

Applicative-order evaluation:

(gcd 206 40)
(gcd 40 (remainder (206 40)))

(gcd 6 (remainder 40 6))
(gcd 6 4)

(gcd 4 (remainder 6 4))
(gcd 2 (remainder 4 2))
(gcd 2 0)

4 remainder operations




