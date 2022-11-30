

(define (make-account balance password)
  (let ((number-of-calls 0))
    (define (call-the-cops)
      "Calling the police!")
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch p m)
      (cond ((not (equal? p password))
	     (set! number-of-calls (+ number-of-calls 1))
	     (lambda (any)
	       (if (>= number-of-calls 7)
		   (call-the-cops)
		   "Insufficient funds")))
	    ((eq? number-of-calls 7) (call-the-cops))
	    ((eq? m 'withdraw) withdraw)
	    ((eq? m 'deposit) deposit)
	    (else (error "Unknown request -- MAKE-ACCOUNT"
			 m))))
    dispatch))
;Value: make-account

(define acc (make-account 100 'vika))
;Value: acc

((acc 'vika 'withdraw) 40)
;Value: 60

((acc 'oleg 'withdraw) 20)
;Value: "Calling the police!"

;Value: "Insufficient funds"

;Value: "Insufficient funds"

;Value: "Insufficient funds"

;Value: "Insufficient funds"

;Value: "Insufficient funds"

;Value: "Insufficient funds"

