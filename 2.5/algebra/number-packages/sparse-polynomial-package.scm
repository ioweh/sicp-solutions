

(define (install-sparse-polynomial-package)
  ;; internal procedures
  (define (order term) (car term))
  (define (coeff term) (cadr term))
  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))
  (define (first-term term-list) (car term-list))
  (define (tag x) (attach-tag 'sparse x))
  (put 'adjoin-term 'sparse
       (lambda (var terms) (tag (adjoin-term var terms))))
  (put 'first-term '(sparse) first-term)
  (put 'make-poly 'sparse
       (lambda (var terms) (tag (adjoin-term var terms)))))