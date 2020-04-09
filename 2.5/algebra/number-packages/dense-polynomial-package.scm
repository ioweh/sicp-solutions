
(define (install-dense-polynomial-package)
  ;; internal procedures
  (define (order term) (car term))
  (define (coeff term) (cadr term))
  (define (adjoin-term term term-list)
    (if (> (order term) (length term-list))
	(adjoin-term term (cons 0 term-list))
	(cons (coeff term) term-list)))
  (define (first-term term-list)
    (make-term (- (length term-list) 1) (car term-list)))
  (define (tag x) (attach-tag 'dense x))
  (put 'adjoin-term 'dense
       (lambda (var terms) (tag (adjoin-term var terms))))
  (put 'first-term '(dense) first-term)
  (put 'make-poly 'dense
       (lambda (var terms) (tag (adjoin-term var terms)))))