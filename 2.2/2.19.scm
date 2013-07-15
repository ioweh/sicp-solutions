
(define (count-change amount)
  (cc amount 5))
;Value: count-change

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
	((or (< amount 0) (= kinds-of-coins 0)) 0)
	(else (+ (cc amount
		     (- kinds-of-coins 1))
		 (cc (- amount
			(first-denomination kinds-of-coins))
		     kinds-of-coins)))))
;Value: cc

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
	((= kinds-of-coins 2) 5)
	((= kinds-of-coins 3) 10)
	((= kinds-of-coins 4) 25)
	((= kinds-of-coins 5) 50)))
;Value: first-denomination

(count-change 100)
;Value: 292

(define us-coins (list 50 25 10 5 1))
;Value: us-coins

(define uk-coins (list 100 50 20 10 5 2 1 .5))
;Value: uk-coins

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else
	 (+ (cc amount
		(except-first-denomination coin-values))
	    (cc (- amount
		   (first-denomination coin-values))
		coin-values)))))
;Value: cc

(define (first-denomination coin-values)
  (car coin-values))
;Value: first-denomination



(define (except-first-denomination coin-values)
  (cdr coin-values))
;Value: except-first-denomination


(define (no-more? coin-values)
  (null? coin-values))
;Value: no-more?

(cc 100 us-coins)
;Value: 292

(cc 10 uk-coins)
;Value: 50

(cc 50 uk-coins)
;Value: 6149

(cc 100 uk-coins)
;Value: 104561

(cc 100 (list 50 25 10 5 1))
;Value: 292

(cc 100 (list 1 5 10 25 50))
;Value: 292

As shown here, the order of the list coin-values doesn't affect the answer. It happens because 
it makes no difference in what direction we are traversing a list, from left to right or from right to left.