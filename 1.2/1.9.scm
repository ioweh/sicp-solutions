(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; take values from the video

(+ 3 4)
(inc (+ 2 4))
(inc (inc (+ 1 4)))
(inc (inc (inc 0 4)))
(inc (inc (inc 4)))
(inc (inc 5))
(inc 6)
7

; this process is recursive


(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(+ 3 4)
(+ 2 5)
(+ 1 6)
(+ 0 7)
7

; this process is iterative
