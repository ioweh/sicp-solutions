
(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))
;Value: last-pair

(last-pair (list 23 72 149 34))
;Value 3: (34)


