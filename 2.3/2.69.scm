
(load "huffman.scm")
;Loading "huffman.scm"... done
;Value: sample-message

(define pairs
  '((A 4) (B 2) (C 1) (D 1)))
;Value: pairs

pairs
;Value 3: ((a 4) (b 2) (c 1) (d 1))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< (weight x) (weight (car set))) (cons x set))
	(else (cons (car set)
		    (adjoin-set x (cdr set))))))
;Value: adjoin-set

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
	(adjoin-set (make-leaf (car pair)   ; symbol
			       (cadr pair)) ; frequency
		    (make-leaf-set (cdr pairs))))))
;Value: make-leaf-set

(make-leaf-set pairs)
;Value 4: ((leaf d 1) (leaf c 1) (leaf b 2) (leaf a 4))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))
;Value: generate-huffman-tree

(define (successive-merge leaf-set)
  (cond ((null? (cdr leaf-set)) (car leaf-set))
	(else (successive-merge (cons (make-code-tree (cadr leaf-set)
						      (car leaf-set))
				      (cddr leaf-set))))))
;Value: successive-merge



(generate-huffman-tree pairs)
;Value 7: ((leaf a 4) ((leaf b 2) ((leaf c 1) (leaf d 1) (c d) 2) (b c d) 4) (a b c d) 8)

(make-code-tree (make-leaf 'A 4)
		(make-code-tree
		 (make-leaf 'B 2)
		 (make-code-tree (make-leaf 'D 1)
				 (make-leaf 'C 1))))
;Value 8: ((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8)

