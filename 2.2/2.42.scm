
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))
;Value: accumulate

(define (flatmap proc seq)
  (accumulate append
	      ()
	      (map proc seq)))
;Value: flatmap

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))))
;Value: enumerate-interval

(enumerate-interval 1 3)
;Value 9: (1 2 3)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions board-size))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))
;Value: queens

(queens 2)
;Value: ()


(queens 4)
;Value 69: (((2 1) (4 2) (1 3) (3 4)) ((3 1) (1 2) (4 3) (2 4)))


;Value 65: (((1 1) (2 2)) ((2 1) (1 2)))



(define empty-board ())
;Value: empty-board



(define (adjoin-position new-row col rest-of-queens)
  (append rest-of-queens
	  (list (list new-row col))))
;Value: adjoin-position

(define (safe? k positions)
  (map (lambda (position)



Let's devise a procedure testing each element of a list if it is equal to one.

(define (isallones? items)
  (accumulate (lambda (x y)
		(and (= 1 x) y))
	      true 
	      items))
;Value: isallones?

Now let's devise a procedure testing each element of list if it's equal to k, a parameter passed to the procedure.

(define (carsnotr? items r)
  (accumulate (lambda (x y)
		(and (not (= (car x) r)) y))
	      true
	      items))
;Value: carsnotr?

Then we'll need to filter the last element.

(define (filter-last-element items)
  (if (null? (cdr items))
      ()
      (cons (car items)
	    (filter-last-element (cdr items)))))
;Value: filter-last-element

(filter-last-element (list 1 2 3 4 5))
;Value 58: (1 2 3 4)

(define (safe-horizontal? k positions)   ; positions here is a simple list of queens
  (let ((j (caar (last-pair positions))))
    (carsnotr?
     (filter-last-element positions)
     j)))
;Value: safe-horizontal?


(safe-horizontal? 666 (list (list 1 2) (list 45 3) (list 450 5)))
;Value: #t


(define (same-diagonal-up? j k positions)
  (cond ((= j 0) false)
	((not (accumulate (lambda (x y)
			    (or (equal? (list j k)
					x)
				y))
			  false
			  positions))
	 (same-diagonal-up? (- j 1) (- k 1) positions))
	(else true)))
;Value: same-diagonal-up?


(same-diagonal-up? 2 4 (list (list 3 1) (list 1 2) (list 4 3)))
;Value: #f


(same-diagonal-up? 1 2 (list (list 1 1)))
;Value: #f

(same-diagonal-up? 3 3 (list (list 1 1)))
;Value: #t

(define (same-diagonal-down? j k positions board-size)
  (cond ((> j board-size) false)                               ; let's assume that the board size is 2
	((not (accumulate (lambda (x y)
			    (or (equal? (list j k)
					x)
				y))
			  false
			  positions))
	 (same-diagonal-down? (+ j 1) (- k 1) positions board-size))
	(else true)))
;Value: same-diagonal-down?


(same-diagonal-down? 2 1 (list (list 1 2)) 2)
;Value: #f

(same-diagonal-down? 1 2 (list (list 2 1)) 2)
;Value: #t

;The two procedures are now tested.

(define (same-diagonal? k positions board-size)
  (let ((j (caar (last-pair positions))))
    (or (same-diagonal-up? j k (filter-last-element positions))
	(same-diagonal-down? j k (filter-last-element positions) board-size))))
;Value: same-diagonal?


(same-diagonal? 4 (list (list 3 1) (list 1 2) (list 4 3) (list 2 4)) 4)
;Value: #f

(same-diagonal? 4 (list (list 3 1) (list 1 2) (list 4 3) (list 3 4)) 4)
;Value: #t

(define (safe? k positions board-size)
  (and (not (same-diagonal? k positions board-size))
       (safe-horizontal? k positions)))
;Value: safe?



(queens 8)
;Value 71: (((1 1) (5 2) (8 3) (6 4) (3 5) (7 6) (2 7) (4 8)) ((1 1) (6 2) (8 3) (3 4) (7 5) (4 6) (2 7) (5 8)) ((1 1) (7 2) (4 3) (6 4) (8 5) (2 6) (5 7) (3 8)) ((1 1) (7 2) (5 3) (8 4) (2 5) (4 6) (6 7) (3 8)) ((2 1) (4 2) (6 3) (8 4) (3 5) (1 6) (7 7) (5 8)) ((2 1) (5 2) (7 3) (1 4) (3 5) (8 6) (6 7) (4 8)) ((2 1) (5 2) (7 3) (4 4) (1 5) (8 6) (6 7) (3 8)) ((2 1) (6 2) (1 3) (7 4) (4 5) (8 6) (3 7) (5 8)) ((2 1) (6 2) (8 3) (3 4) (1 5) (4 6) (7 7) (5 8)) ((2 1) (7 2) (3 3) (6 4) (8 5) (5 6) (1 7) (4 8)) ((2 1) (7 2) (5 3) (8 4) (1 5) (4 6) (6 7) (3 8)) ((2 1) (8 2) (6 3) (1 4) (3 5) (5 6) (7 7) (4 8)) ((3 1) (1 2) (7 3) (5 4) (8 5) (2 6) (4 7) (6 8)) ((3 1) (5 2) (2 3) (8 4) (1 5) (7 6) (4 7) (6 8)) ((3 1) (5 2) (2 3) (8 4) (6 5) (4 6) (7 7) (1 8)) ((3 1) (5 2) (7 3) (1 4) (4 5) (2 6) (8 7) (6 8)) ((3 1) (5 2) (8 3) (4 4) (1 5) (7 6) (2 7) (6 8)) ((3 1) (6 2) (2 3) (5 4) (8 5) (1 6) (7 7) (4 8)) ((3 1) (6 2) (2 3) (7 4) (1 5) (4 6) (8 7) (5 8)) ((3 1) (6 2) (2 3) (7 4) (5 5) (1 6) (8 7) (4 8)) ((3 1) (6 2) (4 3) (1 4) (8 5) (5 6) (7 7) (2 8)) ((3 1) (6 2) (4 3) (2 4) (8 5) (5 6) (7 7) (1 8)) ((3 1) (6 2) (8 3) (1 4) (4 5) (7 6) (5 7) (2 8)) ((3 1) (6 2) (8 3) (1 4) (5 5) (7 6) (2 7) (4 8)) ((3 1) (6 2) (8 3) (2 4) (4 5) (1 6) (7 7) (5 8)) ((3 1) (7 2) (2 3) (8 4) (5 5) (1 6) (4 7) (6 8)) ((3 1) (7 2) (2 3) (8 4) (6 5) (4 6) (1 7) (5 8)) ((3 1) (8 2) (4 3) (7 4) (1 5) (6 6) (2 7) (5 8)) ((4 1) (1 2) (5 3) (8 4) (2 5) (7 6) (3 7) (6 8)) ((4 1) (1 2) (5 3) (8 4) (6 5) (3 6) (7 7) (2 8)) ((4 1) (2 2) (5 3) (8 4) (6 5) (1 6) (3 7) (7 8)) ((4 1) (2 2) (7 3) (3 4) (6 5) (8 6) (1 7) (5 8)) ((4 1) (2 2) (7 3) (3 4) (6 5) (8 6) (5 7) (1 8)) ((4 1) (2 2) (7 3) (5 4) (1 5) (8 6) (6 7) (3 8)) ((4 1) (2 2) (8 3) (5 4) (7 5) (1 6) (3 7) (6 8)) ((4 1) (2 2) (8 3) (6 4) (1 5) (3 6) (5 7) (7 8)) ((4 1) (6 2) (1 3) (5 4) (2 5) (8 6) (3 7) (7 8)) ((4 1) (6 2) (8 3) (2 4) (7 5) (1 6) (3 7) (5 8)) ((4 1) (6 2) (8 3) (3 4) (1 5) (7 6) (5 7) (2 8)) ((4 1) (7 2) (1 3) (8 4) (5 5) (2 6) (6 7) (3 8)) ((4 1) (7 2) (3 3) (8 4) (2 5) (5 6) (1 7) (6 8)) ((4 1) (7 2) (5 3) (2 4) (6 5) (1 6) (3 7) (8 8)) ((4 1) (7 2) (5 3) (3 4) (1 5) (6 6) (8 7) (2 8)) ((4 1) (8 2) (1 3) (3 4) (6 5) (2 6) (7 7) (5 8)) ((4 1) (8 2) (1 3) (5 4) (7 5) (2 6) (6 7) (3 8)) ((4 1) (8 2) (5 3) (3 4) (1 5) (7 6) (2 7) (6 8)) ((5 1) (1 2) (4 3) (6 4) (8 5) (2 6) (7 7) (3 8)) ((5 1) (1 2) (8 3) (4 4) (2 5) (7 6) (3 7) (6 8)) ((5 1) (1 2) (8 3) (6 4) (3 5) (7 6) (2 7) (4 8)) ((5 1) (2 2) (4 3) (6 4) (8 5) (3 6) (1 7) (7 8)) ((5 1) (2 2) (4 3) (7 4) (3 5) (8 6) (6 7) (1 8)) ((5 1) (2 2) (6 3) (1 4) (7 5) (4 6) (8 7) (3 8)) ((5 1) (2 2) (8 3) (1 4) (4 5) (7 6) (3 7) (6 8)) ((5 1) (3 2) (1 3) (6 4) (8 5) (2 6) (4 7) (7 8)) ((5 1) (3 2) (1 3) (7 4) (2 5) (8 6) (6 7) (4 8)) ((5 1) (3 2) (8 3) (4 4) (7 5) (1 6) (6 7) (2 8)) ((5 1) (7 2) (1 3) (3 4) (8 5) (6 6) (4 7) (2 8)) ((5 1) (7 2) (1 3) (4 4) (2 5) (8 6) (6 7) (3 8)) ((5 1) (7 2) (2 3) (4 4) (8 5) (1 6) (3 7) (6 8)) ((5 1) (7 2) (2 3) (6 4) (3 5) (1 6) (4 7) (8 8)) ((5 1) (7 2) (2 3) (6 4) (3 5) (1 6) (8 7) (4 8)) ((5 1) (7 2) (4 3) (1 4) (3 5) (8 6) (6 7) (2 8)) ((5 1) (8 2) (4 3) (1 4) (3 5) (6 6) (2 7) (7 8)) ((5 1) (8 2) (4 3) (1 4) (7 5) (2 6) (6 7) (3 8)) ((6 1) (1 2) (5 3) (2 4) (8 5) (3 6) (7 7) (4 8)) ((6 1) (2 2) (7 3) (1 4) (3 5) (5 6) (8 7) (4 8)) ((6 1) (2 2) (7 3) (1 4) (4 5) (8 6) (5 7) (3 8)) ((6 1) (3 2) (1 3) (7 4) (5 5) (8 6) (2 7) (4 8)) ((6 1) (3 2) (1 3) (8 4) (4 5) (2 6) (7 7) (5 8)) ((6 1) (3 2) (1 3) (8 4) (5 5) (2 6) (4 7) (7 8)) ((6 1) (3 2) (5 3) (7 4) (1 5) (4 6) (2 7) (8 8)) ((6 1) (3 2) (5 3) (8 4) (1 5) (4 6) (2 7) (7 8)) ((6 1) (3 2) (7 3) (2 4) (4 5) (8 6) (1 7) (5 8)) ((6 1) (3 2) (7 3) (2 4) (8 5) (5 6) (1 7) (4 8)) ((6 1) (3 2) (7 3) (4 4) (1 5) (8 6) (2 7) (5 8)) ((6 1) (4 2) (1 3) (5 4) (8 5) (2 6) (7 7) (3 8)) ((6 1) (4 2) (2 3) (8 4) (5 5) (7 6) (1 7) (3 8)) ((6 1) (4 2) (7 3) (1 4) (3 5) (5 6) (2 7) (8 8)) ((6 1) (4 2) (7 3) (1 4) (8 5) (2 6) (5 7) (3 8)) ((6 1) (8 2) (2 3) (4 4) (1 5) (7 6) (5 7) (3 8)) ((7 1) (1 2) (3 3) (8 4) (6 5) (4 6) (2 7) (5 8)) ((7 1) (2 2) (4 3) (1 4) (8 5) (5 6) (3 7) (6 8)) ((7 1) (2 2) (6 3) (3 4) (1 5) (4 6) (8 7) (5 8)) ((7 1) (3 2) (1 3) (6 4) (8 5) (5 6) (2 7) (4 8)) ((7 1) (3 2) (8 3) (2 4) (5 5) (1 6) (6 7) (4 8)) ((7 1) (4 2) (2 3) (5 4) (8 5) (1 6) (3 7) (6 8)) ((7 1) (4 2) (2 3) (8 4) (6 5) (1 6) (3 7) (5 8)) ((7 1) (5 2) (3 3) (1 4) (6 5) (8 6) (2 7) (4 8)) ((8 1) (2 2) (4 3) (1 4) (7 5) (5 6) (3 7) (6 8)) ((8 1) (2 2) (5 3) (3 4) (1 5) (7 6) (4 7) (6 8)) ((8 1) (3 2) (1 3) (6 4) (2 5) (5 6) (7 7) (4 8)) ((8 1) (4 2) (1 3) (3 4) (6 5) (2 6) (7 7) (5 8)))






(last-pair (list (list 1 2) (list 2 3) (list 3 4)))
;Value 37: ((3 4))


(define (test board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(flatmap
	 (lambda (rest-of-queens)
	   (map (lambda (new-row)
		  (adjoin-position new-row k rest-of-queens))
		(enumerate-interval 1 board-size)))
	 (queen-cols (- k 1)))))
  (queen-cols board-size))
;Value: test

(test 2)
;Value 32: (((1 1) (1 2)) ((1 1) (2 2)) ((2 1) (1 2)) ((2 1) (2 2)))

(adjoin-position 1 2 ())
;Value 33: ((1 2))

(test 1)
;Value 34: (((1 1)))


































