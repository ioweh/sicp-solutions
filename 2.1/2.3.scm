
(define (make-point x y)
  (cons x y))
;Value: make-point

(define (x-point pt)
  (car pt))
;Value: x-point

(define (y-point pt)
  (cdr pt))
;Value: y-point


(define (make-segment pt1 pt2)
  (cons pt1 pt2))
;Value: make-segment

(define (start-segment st)
  (car st))
;Value: start-segment

(define (end-segment st)
  (cdr st))
;Value: end-segment

Let's make a rectangle using two segments and then two points.

(define (make-rectangle st1 st2)
  (cons st1 st2))
;Value: make-rectangle

(define pt1 (make-point 1 1))
;Value: pt1

(define pt2 (make-point 1 4))
;Value: pt2

(define pt3 (make-point 6 4))
;Value: pt3

(define s1 (make-segment pt1 pt2))
;Value: s1

(define s2 (make-segment pt2 pt3))
;Value: s2

(define rec (make-rectangle s1 s2))
;Value: rec


(define (length sgmt)
  (sqrt (+ (square (- (x-point (end-segment sgmt)) (x-point (start-segment sgmt))))
	   (square (- (y-point (end-segment sgmt)) (y-point (start-segment sgmt)))))))
;Value: length

(length s1)
;Value: 3

(length s2)
;Value: 5

(define (first-segment rec)
  (car rec))
;Value: first-segment

(define (second-segment rec)
  (cdr rec))
;Value: second-segment

(define a (first-segment rec))
;Value: a

(define b (second-segment rec))
;Value: b

(perimeter rec)
;Value: 16

(area rec)
;Value: 15



(define (make-rectangle pt1 pt2)
  (cons pt1 pt2))
;Value: make-rectangle


(define pt1 (make-point 1 4))
;Value: pt1

(define pt2 (make-point 6 1))
;Value: pt2

(define rec (make-rectangle pt1 pt2))
;Value: rec


(define (start-point rec)
  (car rec))
;Value: start-point


(define (end-point rec)
  (cdr rec))
;Value: end-point



(define (perimeter rec)
  (+ (* 2 (length a))
     (* 2 (length b))))
;Value: perimeter

(define (area rec)
  (* (length a) (length b)))
;Value: area


a, b are the segments, which represent the sides of the rectangle

(define a (make-segment (start-point rec)
			(make-point (x-point (start-point rec))
				    (y-point (end-point rec)))))
;Value: a


(define b (make-segment (start-point rec)
			(make-point (x-point (end-point rec))
				    (y-point (start-point rec)))))
;Value: b

(perimeter rec)
;Value: 16

(area rec)
;Value: 15



***

Let's use a simpler implementation:

 
(define (perimeter rect)
  (* 2 (+ (width rect) (height rect))))
;Value: perimeter


(define (area rect)
  (* (width rect) (height rect)))
;Value: area


; Now we'll also need to correct the width and height procedures when we change the make-rect procedure.

; Let's define a rectangle as two segments. We'll use the same procedure for calculating length of a segment and creating a point and a segment and also their selectors as above.

(define make-rect cons)
;Value: make-rect

(define (width rect)
  (length (car rect)))
;Value: width

(define (height rect)
  (length (cdr rect)))
;Value: height

(define ri1 (make-rect (make-segment (make-point 0 0)
				     (make-point 0 2))
		       (make-segment (make-point 0 0)
				     (make-point 3 0))))
;Value: ri1

(perimeter ri1)
;Value: 10

(area ri1)
;Value: 6


; And now let's try a different definition:


(define (make-rect p0 w h)
  (cons p0 (cons w h)))
;Value: make-rect

(define (width rect)
  (car (cdr rect)))
;Value: width

(define (height rect)
  (cdr (cdr rect)))
;Value: height

(define ri2 (make-rect (make-point 1 1) 3 2))
;Value: ri2

(perimeter ri2)
;Value: 10

(area ri2)
;Value: 6
