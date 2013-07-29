#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 0)))
(define (transform-my-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
         (make-frame new-origin
                     (vector-sub (m corner1) new-origin)
                     (vector-sub (m corner2) new-origin)))))))

(define (my-flip-vert painter)
  (transform-my-painter painter
                     (make-vect 0.0 1.0)   ; new origin
                     (make-vect 1.0 1.0)   ; new end of edge1
                     (make-vect 0.0 0.0))) ; new end of edge 2

(define (my-shrink-to-upper-right painter)
  (transform-my-painter painter
                     (make-vect 0.5 0.5)
                     (make-vect 1.0 0.5)
                     (make-vect 0.5 1.0)))

(define (myrotate90 painter)
  (transform-my-painter painter
                        (make-vect 1.0 0.0)
                        (make-vect 1.0 1.0)
                        (make-vect 0.0 0.0)))

(define (squash-inwards painter)
  (transform-my-painter painter 
                     (make-vect 0.0 0.0)
                     (make-vect 0.65 0.35)
                     (make-vect 0.35 0.65)))

(define (mybeside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-my-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right 
           (transform-my-painter painter2
                                split-point
                                (make-vect 1.0 0.0)
                                (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

(define (my-flip-horiz painter)
  (transform-my-painter painter
                        (make-vect 1.0 0.0)
                        (make-vect 0.0 0.0)
                        (make-vect 1.0 1.0)))
(paint (my-flip-horiz einstein))

(define (my-rotate180 painter)
  (transform-my-painter painter
                        (make-vect 1.0 1.0)
                        (make-vect 0.0 1.0)
                        (make-vect 1.0 0.0)))
(paint (my-rotate180 einstein))

(define (my-rotate270 painter)
  (transform-my-painter painter
                        (make-vect 0.0 1.0)
                        (make-vect 0.0 0.0)
                        (make-vect 1.0 1.0)))
(paint (my-rotate270 einstein))


(define (my-below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-below
           (transform-my-painter painter1
                              (make-vect 0.0 0.0)
                              (make-vect 1.0 0.0)
                              split-point))
          (paint-above
           (transform-my-painter painter2
                              split-point
                              (make-vect 1.0 0.5)
                              (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-below frame)
        (paint-above frame)))))

(paint (my-below einstein einstein))

(define (my-below2 painter1 painter2)
  (my-rotate270 (mybeside (myrotate90 einstein)
                          (myrotate90 einstein))))

(paint (my-below2 einstein einstein))