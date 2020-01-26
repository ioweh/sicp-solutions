
(load "C:\\Users\\User\\Desktop\\sicp-solutions\\2.5\\algebra\\number-packages\\integer-package.scm")
(load "C:\\Users\\User\\Desktop\\sicp-solutions\\2.5\\algebra\\number-packages\\real-package.scm")
(load "C:\\Users\\User\\Desktop\\sicp-solutions\\2.5\\algebra\\number-packages\\rational-package.scm")
(load "C:\\Users\\User\\Desktop\\sicp-solutions\\2.5\\algebra\\number-packages\\rectangular-package.scm")
(load "C:\\Users\\User\\Desktop\\sicp-solutions\\2.5\\algebra\\number-packages\\polar-package.scm")
(load "C:\\Users\\User\\Desktop\\sicp-solutions\\2.5\\algebra\\number-packages\\complex-package.scm")
(load "C:\\Users\\User\\Desktop\\sicp-solutions\\2.5\\algebra\\number-packages\\polynomial-package.scm")


(define (attach-tag type-tag contents)
  (cond ((equal? type-tag 'real) (cons type-tag contents))
	((number? contents) contents)
	(else (cons type-tag contents))))
;Value: attach-tag

(define (type-tag datum)
  (cond ((pair? datum) (car datum))
	((number? datum) 'scheme-number)
	(true (error "Bad tagged datum -- TYPE-TAG" datum))))
;Value: type-tag

(define (contents datum)
  (cond ((pair? datum) (cdr datum))
	((number? datum) datum)
	(true (error "Bad tagged datum -- CONTENTS" datum))))
;Value: contents


(define *op-table* (make-hash-table))
;Value: *op-table*

(define (put op type proc)
  (hash-table/put! *op-table* (list op type) proc))
;Value: put

(define (get op type)
  (hash-table/get *op-table* (list op type) #f))
;Value: get



(define (equ? x y) (apply-generic 'equ? x y))



(install-scheme-number-package)

(install-rectangular-package)

(install-polar-package)

(install-real-package)

(install-rational-package)

(install-complex-package)

(install-polynomial-package)


(define *coercion-table* (make-equal-hash-table))

(define (put-coercion type1 type2 proc)
  (hash-table/put! *coercion-table* (list type1 type2) proc))

(define (get-coercion type1 type2)
  (hash-table/get *coercion-table* (list type1 type2) '()))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (accumulate1 op seq)
  (if (null? seq)
      '()
      (accumulate op (car (reverse seq)) (reverse (cdr (reverse seq))))))

(define (raise x) (apply-generic 'raise x))

(define (integer->rational n)
  (make-rational n 1))

(put 'raise '(scheme-number) integer->rational)

(define (rational->real r)
  (make-real-scheme-number (/ (car r) (cdr r))))

(put 'raise '(rational) rational->real)

(define (real->complex x)
  (make-complex-from-real-imag x 0))

(put 'raise '(real) real->complex)

(define (install-into-hierarchy installed-type lower-type hierarchy)
  (if (eq? (car hierarchy) lower-type)
      (cons lower-type (cons installed-type (cdr hierarchy)))
      (cons (car hierarchy) (install-into-hierarchy installed-type lower-type (cdr hierarchy)))))

(define h2 (install-into-hierarchy 'complex 'rational (list 'scheme-number 'rational)))

(define h3 (install-into-hierarchy 'real 'rational h2))

(define (dropUntil pred list)
  (cond ((null? list) list)
	((pred (car list)) list)
	(else (dropUntil pred (cdr list)))))

(define (belongs el list)
  (cond ((null? list) #f)
	((eq? el (car list)) #t)
	(else (belongs el (cdr list)))))

(define (higher t1 t2 hierarchy)
  (if (belongs t2 (dropUntil (lambda (el) (eq? el t1)) hierarchy))
      #f
      #t))

(define (raise-to-higher lower-val higher-type)
  (if (eq? (type-tag lower-val) higher-type)
      lower-val
      (raise-to-higher (raise lower-val) higher-type)))

(define (get-highest-type arguments)
  (accumulate1 (lambda (x acc) (if (higher x acc h3) x acc)) arguments))

(define (coerce-to-highest-type . args)
  (let ((highest-type (get-highest-type (map type-tag args))))
    (map (lambda (arg) (raise-to-higher arg highest-type)) args)))


(define (project x) (apply-generic 'project x))

(put 'project '(complex) (lambda (x) (make-real-scheme-number (real-part x))))

(define (fractional? x)
  (not (= (floor x) x)))

(define (make-rational-from-real x)
  (define (make-rational-from-real-iter num denom)
    (if (fractional? num)
	(make-rational-from-real-iter (* 10 num) (* 10 denom))
	(make-rational num denom)))
  (make-rational-from-real-iter x 1))

(put 'project '(real) (lambda (x) (make-rational-from-real x)))

(put 'project '(rational) (lambda (r) (round (/ (car r) (cdr r)))))

(define (lowest-type? x)
  (eq? (type-tag x) 'scheme-number))

(define (drop x)
  (let ((dropped (project x)))
    (if (or (lowest-type? x) (not (equ? (raise dropped) x)))
	x
	(drop dropped))))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (let ((result (if proc
			(apply proc (map contents args))
			(let* ((highest-type (get-highest-type type-tags))
			      (raised-proc (get op (list highest-type highest-type))))
			  (accumulate1 raised-proc (map contents (apply coerce-to-highest-type args)))))))
	(if (or (eq? op 'drop) (eq? op 'project) (eq? op 'equ?) (eq? op 'raise) (eq? op '=zero?))
	    result
	    (drop result))))))

(define (real-part z) (apply-generic 'real-part z))
;Value: real-part

(define (imag-part z) (apply-generic 'imag-part z))
;Value: imag-part

(define (magnitude z) (apply-generic 'magnitude z))
;Value: magnitude

(define (angle z) (apply-generic 'angle z))
;Value: angle


(define (add x y) (apply-generic 'add x y))
;Value: add

(define (sub x y) (apply-generic 'sub x y))
;Value: sub

(define (mul x y) (apply-generic 'mul x y))
;Value: mul

(define (div x y) (apply-generic 'div x y))
;Value: div

(define (equ? x y) (apply-generic 'equ? x y))
;Value: equ?

(define (negate x) (apply-generic 'negate x))
;Value: negate

(define (=zero? x) (apply-generic '=zero? x))
;Value: =zero?


(define (sine x) (apply-generic 'sine x))
;Value: sine

(define (cosine x) (apply-generic 'cosine x))
;Value: cosine

(define (square x) (apply-generic 'square x))
;Value: square

(define (sqrt x) (apply-generic 'sqrt x))
;Value: sqrt

(define (atan x) (apply-generic 'atan x))
;Value: atan

