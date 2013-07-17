
(define (make-mobile left right)
  (list left right))
;Value: make-mobile

(define (make-branch length structure)
  (list length structure))
;Value: make-branch

(define (left-branch mobile)
  (car mobile))
;Value: left-branch

(define (right-branch mobile)
  (cadr mobile))
;Value: right-branch

(define (branch-length branch)
  (car branch))
;Value: branch-length

(define (branch-structure branch)
  (cadr branch))
;Value: branch-structure

(define (total-weight mobile)
  (if (not (list? mobile))
      mobile
      (+ (total-weight (branch-structure (left-branch mobile)))
	 (total-weight (branch-structure (right-branch mobile))))))
;Value: total-weight

test

(define a1 (make-branch 2 4))
;Value: a1

(define a2 (make-branch 2 1))
;Value: a2

(define m1 (make-mobile a1 a2))
;Value: m1

(define b1 (make-branch 4 m1))
;Value: b1

(define b2 (make-branch 1 8))
;Value: b2

(define m2 (make-mobile b1 b2))
;Value: m2

(define c1 (make-branch 4 m2))
;Value: c1

(define b3 (make-branch 2 6))
;Value: b3

(define b4 (make-branch 3 3))
;Value: b4

(define m3 (make-mobile b3 b4))
;Value: m3

(define c2 (make-branch 5 m3))
;Value: c2

(define m4 (make-mobile c1 c2))
;Value: m4

m4
;Value 9: ((4 ((4 ((2 4) (2 1))) (1 8))) (5 ((2 6) (3 3))))

(total-weight m4)
;Value: 22


(define (balanced? mobile)
  (if (not (list? mobile))
      true
      (= (* (branch-length (left-branch mobile))
	    (total-weight (branch-structure (left-branch mobile))))
	 (* (branch-length (right-branch mobile))
	    (total-weight (branch-structure (right-branch mobile)))))))
;Value: balanced?


(balanced? m4)
;Value: #f


(define w1 (make-branch 3 4))
;Value: w1

(define w2 (make-branch 4 3))
;Value: w2

(define m5 (make-mobile w1 w2))
;Value: m5

(balanced? m5)
;Value: #t

Let's take into account that each of the submobiles hanging off the branches of a mobile must be balanced.

(define (fully-balanced? mobile)
  (and (balanced? mobile)
       (balanced? (branch-structure (left-branch mobile)))
       (balanced? (branch-structure (right-branch mobile)))))
;Value: fully-balanced?


(fully-balanced? m5)
;Value: #t


(fully-balanced? m4)
;Value: #f

(define b1 (make-branch 2 1))
;Value: b1

(define b2 (make-branch 2 1))
;Value: b2

(define mobile1 (make-mobile b1 b2))
;Value: mobile1

(define b3 (make-branch 4 3))
;Value: b3

(define b4 (make-branch 2 6))
;Value: b4

(define mobile2 (make-mobile b3 b4))
;Value: mobile2

(define bch1 (make-branch 3 mobile1))
;Value: bch1

(define bhc2 (make-branch 4 mobile2))
;Value: bhc2

(define mobile3 (make-mobile bch1 bhc2))
;Value: mobile3

(fully-balanced? mobile3)
;Value: #f

(define bch1 (make-branch 9 mobile1))
;Value: bch1

(define bch2 (make-branch 2 mobile2))
;Value: bch2

(define mobile3 (make-mobile bch1 bch2))
;Value: mobile3

(fully-balanced? mobile3)
;Value: #t

d. Suppose we change the representation of mobiles

(define (make-mobile left right)
  (cons left right))
;Value: make-mobile

(define (make-branch length structure)
  (cons length structure))
;Value: make-branch

We are supposed to only change the structure of the selectors we defined.

(define (left-branch mobile)
  (car mobile))
;Value: left-branch

(define (right-branch mobile)
  (cdr mobile))
;Value: right-branch

(define (branch-length branch)
  (car branch))
;Value: branch-length

(define (branch-structure branch)
  (cdr branch))
;Value: branch-structure


We need to also change (list? ...) to (pair? ...).



