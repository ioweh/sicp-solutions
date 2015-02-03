(define (element-value xpos ypos)
  (cond ((= xpos 0) 1)
	((= xpos ypos) 1)
	(else (+ (element-value (- xpos 1) (- ypos 1))
		 (element-value xpos (- ypos 1))))))
;Value: element-value

(element-value 1 4)
;Value: 4

(element-value 2 4)
;Value: 6

(element-value 3 4)
;Value: 4

(element-value 1 2)
;Value: 2

(element-value 1 3)
;Value: 3

