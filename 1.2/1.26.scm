
(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (* (expmod base (/ exp 2) m)
		       (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

Clearly, we now call expmod twice. At each computation the amount of steps divides and multiplies by 2.
The total amount of steps is proportional to exp.


A more detailed answer:

At each step of the computation we now double the number of calls to the expmod procedure. The number of computations will be proportional to log N, where N is the input parameter (namely, the positive integer less than n, where n is the supposed to be prime to be tested). Therefore, number of expmod calls will be proportional to 2*2*2*...*2 log N times. Thus, the time complexity will be O(n).