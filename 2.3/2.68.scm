
(load "huffman.scm")
;Loading "huffman.scm"... done
;Value: sample-message

(decode sample-message sample-tree)
;Value 2: (a d a b b c a)

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
	      (encode (cdr message) tree))))
;Value: encode

(define (encode-symbol symbol tree)
  (cond ((not (belongs? symbol (symbols tree)))
	 (error "the symbol doesn't belong to the tree -- ENCODE-SYMBOL" symbol))
	((leaf? tree) '())
	(else
	 (if (belongs? symbol (symbols (left-branch tree)))
	     (cons 0 (encode-symbol symbol (left-branch tree)))
	     (cons 1 (encode-symbol symbol (right-branch tree)))))))
;Value: encode-symbol


(define (belongs? symbol symbols)
  (cond ((null? symbols) false) 
	((eq? symbol (car symbols))
	 true)
	(else (belongs? symbol (cdr symbols)))))
;Value: belongs?


sample-tree
;Value 6: ((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8)


(encode-symbol 'L sample-tree)
;the symbol doesn't belong to the tree -- ENCODE-SYMBOL l
;To continue, call RESTART with an option number:
; (RESTART 6) => Return to read-eval-print level 6.
; (RESTART 5) => Return to read-eval-print level 5.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(encode-symbol 'B sample-tree)
;Value 13: (1 0)

(decode sample-message sample-tree)
;Value 14: (a d a b b c a)

sample-message
;Value 15: (0 1 1 0 0 1 0 1 0 1 1 1 0)


(encode '(a d a b b c a) sample-tree)
;Value 16: (0 1 1 0 0 1 0 1 0 1 1 1 0)

Most likely, it has O(n*logn) time complexity, as it passes log(n) nodes, and at each node takes roughly n steps
for the belongs? procedure.

