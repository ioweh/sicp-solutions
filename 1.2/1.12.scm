
(define (element depth position)
  (cond ((= depth 1) 1)
	((or (= position 1) (= position depth)) 1)
	(else (+ (element (- depth 1) (- position 1)) (element (- depth 1) position)))))
;Value: element

(element 3 2)
;Value: 2

(element 5 4)
;Value: 4

(element 5 3)
;Value: 6

