#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 0)))
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (flipped-pairs painter)
  (let ((combine4 (square-of-four identity flip-vert
                                  identity flip-vert)))
    (combine4 painter)))




(define (split pos1 pos2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split pos1 pos2) painter (- n 1))))
          (pos1 painter (pos2 smaller smaller))))))

(define right-split (split beside below))

(paint (right-split einstein 3))

(define up-split (split below beside))

(paint (up-split einstein 3))


***

#lang sicp
(#%require sicp-pict)
(define (split t1 t2)
  (define (split-step painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-step painter (- n 1))))
          (t1 painter (t2 smaller smaller)))))
  split-step)
(define right-split (split beside below))
(paint (right-split einstein 3))
(define up-split (split below beside))
(paint (up-split einstein 3))

