
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



***

One more solution:


(define (make-mobile left right)
  (list left right))
;Value: make-mobile

(define (make-branch length structure)
  (list length structure))
;Value: make-branch

(define left-branch car)
;Value: left-branch

(define right-branch cadr)
;Value: right-branch

(define branch-length car)
;Value: branch-length

(define branch-structure cadr)
;Value: branch-structure

(define m1 (make-mobile (make-branch 3 40)
			(make-branch 4 25)))
;Value: m1


m1
;Value 19: ((3 . 40) 4 . 25)

(define m2 (make-mobile (make-branch 3 40)
			(make-branch 4 (make-mobile (make-branch 3 11)
						    (make-branch 4 12)))))
;Value: m2

m2
;Value 20: ((3 . 40) 4 (3 . 11) 4 . 12)


(define (balanced? m)
  (cadr (calc-weight-state m)))
;Value: balanced?

(define (calc-weight-state m)
  (let ((weight-state-left (if (pair? (branch-structure (left-branch m)))
			       (calc-weight-state (branch-structure (left-branch m)))
			       (list (branch-structure (left-branch m)) #t)))
	(weight-state-right (if (pair? (branch-structure (right-branch m)))
				(calc-weight-state (branch-structure (right-branch m)))
				(list (branch-structure (right-branch m)) #t))))
    (list (+ (car weight-state-left) (car weight-state-right))
	  (and (cadr weight-state-left) (cadr weight-state-right) (= (* (branch-length (left-branch m)) (car weight-state-left))
								     (* (branch-length (right-branch m)) (car weight-state-right)))))))
;Value: calc-weight-state


(calc-weight-state m1)
;Value 15: (65 #f)

(calc-weight-state m2)
;Value 16: (63 #f)

(define m3 (make-mobile (make-branch 3 40)
			(make-branch 2 (make-mobile (make-branch 4 20)
						    (make-branch 2 40)))))
;Value: m3

m3
;Value 21: ((3 . 40) 2 (4 . 20) 2 . 40)

(calc-weight-state m3)
;Value 18: (100 #t)

(balanced? m3)
;Value: #t

(balanced? m2)
;Value: #f

(balanced? m3)
;Value: #t

(define (make-mobile left right)
  (cons left right))
;Value: make-mobile

(define (make-branch length structure)
  (cons length structure))
;Value: make-branch

(define left-branch car)
;Value: left-branch

(define right-branch cdr)
;Value: right-branch

(define branch-length car)
;Value: branch-length

(define branch-structure cdr)
;Value: branch-structure


(calc-weight-state m3)
;Value 22: (100 #t)


; only selectors need to be changed

(balanced? m3)
;Value: #t

(balanced? m2)
;Value: #f

(define (total-weight m)
  (define (branch-weight b)
    (if (not (pair? (branch-structure b)))
	(branch-structure b)
	(total-weight (branch-structure b))))
  (+ (branch-weight (left-branch m))
     (branch-weight (right-branch m))))
;Value: total-weight

(total-weight m1)
;Value: 65

(total-weight m2)
;Value: 63

(total-weight m3)
;Value: 100

; indeed, only selectors need to be changed

