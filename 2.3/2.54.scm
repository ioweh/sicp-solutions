
We suppose that the lists to be compared both have the same length.

(define (myequal? list1 list2)
  (cond ((or (null? list1) (null? list2))
	 true)
	((and (symbol? (car list1))
	      (symbol? (car list2))
	      (eq? (car list1) (car list2)))
	 (myequal? (cdr list1) (cdr list2)))
	((and (list? (car list1))
	      (list? (car list2))
	      (myequal? (car list1) (car list2)))
	 (myequal? (cdr list1) (cdr list2)))
	(else false)))
;Value: myequal?

(myequal? '(this is a list) '(this is a list))
;Value: #t


(myequal? '(this is the list) '(this is a list))
;Value: #f

(myequal? '(this (is a) list) '(this (is a) list))
;Value: #t

(myequal? '(this (is a) list) '(this is a list))
;Value: #f



***

#lang sicp
; we already have list? and symbol? defined

(define (symbol-or-empty-list-or-number? x)
  (or (symbol? x) (eq? '() x) (number? x)))

(define (symbol-or-empty-list? x)
  (or (symbol? x) (eq? '() x)))

;(eq? '() '())

; nm, we can run eq? on empty lists, so the symbol-or-empty-list? procedure will do

; let's not forget about cases like '() and '(a b c) and introduce non-empty-list?

(define (non-empty-list? x)
  (and (list? x) (not (eq? x '()))))

(define (equal? a b)
  (cond ((and (symbol-or-empty-list-or-number? a) (symbol-or-empty-list-or-number? b))
         (eq? a b))
        ((and (and (non-empty-list? a) (non-empty-list? b))
              (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
         true)
        (else false)))


(define (equal? a b)
  (cond ((and (symbol-or-empty-list? a) (symbol-or-empty-list? b))
         (eq? a b))
        ((and (and (non-empty-list? a) (non-empty-list? b))
              (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
         true)
        (else (and (number? a) (number? b) (= a b)))))


(equal? '(this is a list) '(this (is a) list))

