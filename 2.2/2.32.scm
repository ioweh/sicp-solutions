
Wishful thinking...

We suppose that the subsets procedure is already defined. It gets us all subsets of the (cdr s).
Then we append them to the beginning of the list and combine each of subsets together with (car s).

<??>

(lambda (element)
  (cons (car s) element))   rest

(define (subsets s)
  (if (null? s)
      (list ())
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (element)
			    (cons (car s) element)) rest)))))
;Value: subsets


(subsets (list 1 2 3))
;Value 7: (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))

