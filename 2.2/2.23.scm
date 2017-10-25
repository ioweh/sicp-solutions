
for-each
;Value 2: #[compiled-procedure 2 ("list" #x6d) #x3 #x4a750]

(for-each (lambda (x) (newline) (display x))
	  (list 57 321 88))

57
321
88
;Unspecified return value

(define (for-each proc items)
  (cond ((null? items)
	 (newline))
	(else
	 (proc (car items))
	 (for-each proc (cdr items)))))
;Value: for-each


(for-each (lambda (x) (newline) (display x))
	  (list 57 321 88 true))

57
321
88
#t
;Unspecified return value



***


(define (foreach proc items)
  (if (null? items)
      true
      ((lambda ()
	 (proc (car items))
	 (foreach proc (cdr items))))))
;Value: foreach
