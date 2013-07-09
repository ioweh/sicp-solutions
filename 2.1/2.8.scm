
The smallest result we could get would be the subtracting the biggest number from the smallest number. Hence,

(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
		 (- (upper-bound b) (lower-bound a))))
;Value: sub-interval

