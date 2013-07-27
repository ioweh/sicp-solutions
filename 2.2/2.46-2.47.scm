#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 0)))

(define (make-my-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define ycor-vect
  (lambda (vect)
    (cdr vect)))

(define a (make-my-vect 2 3))

(define y (ycor-vect a))

(define x (xcor-vect a))

(define (add-vect a b)
  (make-vect (+ (xcor-vect a) (xcor-vect b))
             (+ (ycor-vect a) (ycor-vect b))))

(define b (make-my-vect 2 2))

(define sum (add-vect a b))

(define sub-vect
  (lambda (a b)
    (make-vect (- (xcor-vect a) (xcor-vect b))
               (- (ycor-vect a) (ycor-vect b)))))

(define sub (sub-vect a b))

(define scale-vect
  (lambda (vect const)
    (make-vect (* const (xcor-vect vect))
               (* const (ycor-vect vect)))))

(define (make-my-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

(define myframe (make-my-frame (make-my-vect 2 2)
                               (make-my-vect 3 2)
                               (make-my-vect 1 3)))


(origin-frame myframe)
(edge1-frame myframe)
(edge2-frame myframe)

(define (make-my-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define myframe2 (make-my-frame2 (make-my-vect 2 2)
                                 (make-my-vect 3 2)
                                 (make-my-vect 1 3)))

(define (edge2-frame2 frame)
  (cddr frame))

(origin-frame myframe2)
(edge1-frame myframe2)
(edge2-frame2 myframe2)

(define (my-frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

