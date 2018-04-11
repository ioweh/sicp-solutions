#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 0)))

(define (polyline vectors)
  (if (equal? (cdr vectors) '())
      '()
      (cons (make-segment
             (car vectors)
             (cadr vectors))
            (polyline (cdr vectors)))))

(define list-of-vectors1
  (list (make-vect 0.26 0)
        (make-vect 0.363 0.51)
        (make-vect 0.31 0.6)
        (make-vect 0.16 0.4)
        (make-vect 0 0.64)))

(define list-of-vectors2
  (list (make-vect 0 0.85)
        (make-vect 0.16 0.6)
        (make-vect 0.31 0.66)
        (make-vect 0.42 0.66)
        (make-vect 0.36 0.86)
        (make-vect 0.41 1)))

(define list-of-vectors3
  (list (make-vect 0.6 1)
        (make-vect 0.66 0.86)
        (make-vect 0.6 0.66)
        (make-vect 0.77 0.66)
        (make-vect 1 0.36)))

(define list-of-vectors4
  (list (make-vect 1 0.16)
        (make-vect 0.61 0.46)
        (make-vect 0.77 0)))

(define list-of-vectors5
  (list (make-vect 0.62 0)
        (make-vect 0.51 0.3)
        (make-vect 0.41 0)))

(define list-of-vectors6
  (list (make-vect 0.42 0.81)
        (make-vect 0.51 0.71)
        (make-vect 0.6 0.8)))

(define mypainter (segments->painter (append
                                      (polyline list-of-vectors1)
                                      (polyline list-of-vectors2)
                                      (polyline list-of-vectors3)
                                      (polyline list-of-vectors4)
                                      (polyline list-of-vectors5)
                                      (polyline list-of-vectors6))))

(paint mypainter)

; in order to get the rat coordinates                           
(define (make-position x y)
  (cons x y))

(define (xpos position)
  (car position))

(define (ypos position)
  (cdr position))

(define initial (make-position 112 536))

(define new (make-position 219 392))

(define offset
  (lambda (initial new)
    (make-position (- (xpos new) (xpos initial))
                   (- (ypos new) (ypos initial)))))

(define scale-offset
  (let ((maxx (- 292 113))
        (maxy (- 232 412)))
    (lambda (offset)
      (make-position (* 1.0 (/ (xpos offset) maxx))
                     (* 1.0 (abs (/ (ypos offset) maxy)))))))
    

(scale-offset (offset initial new))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))



(define (split proc1 proc2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split proc1 proc2) painter (- n 1))))
          (proc1 painter (proc2 smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(paint (corner-split mypainter 4))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert rotate180
                                  identity flip-horiz)))
    (combine4 (corner-split painter n))))

(paint (square-limit mypainter 5))


***

#lang sicp
(#%require sicp-pict)

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside quarter (flip-horiz quarter))))
      (below half (flip-vert half)))))

(paint (square-limit einstein 4))
