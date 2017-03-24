(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
;Value: expmod

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
;Value: fermat-test

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))
;Value: fast-prime?

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
;Value: timed-prime-test

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))
;Value: start-prime-test

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
;Value: report-prime



; let's take the values from the last example

(timed-prime-test 10000000000051)

10000000000051 *** 0.
;Unspecified return value

(timed-prime-test 4398042316799)

4398042316799 *** 0.
;Unspecified return value

(timed-prime-test 1298074214633706835075030044377087)

1298074214633706835075030044377087 *** .00999999999999801
;Unspecified return value

(timed-prime-test 1363005552434666078217421284621279933627102780881053358473)

1363005552434666078217421284621279933627102780881053358473 *** .00999999999999801
;Unspecified return value



Let's run the test with bigger numbers to get some discernible results.


(search-for-primes 10000000000000 10000000000100)

10000000000037 *** 1.375
10000000000051 *** 1.4079999999999586
10000000000099 *** 1.393000000000029
;Unspecified return value

(search-for-primes 10000000000000000 10000000000000100)

10000000000000061 *** 1.8280000000000314
10000000000000069 *** 1.76400000000001
10000000000000079 *** 1.843999999999994
10000000000000099 *** 1.813000000000045
;Unspecified return value


Note that the input increased 1000 times. Now, let's calculate how the amounts of time required for the algorithm execution on two different steps relate to each other.

For the first procedure, which has logarithmic growth, the time is proportional to the log(n), where n is the input parameter. Let's assume that the exact time required is some constant k multiplied by the log(n), or

k log(n)

Now let's consider the second step. The amount of time required is:

k log (1000 n)

We can transform this expression to the following one:

k log 1000 + k log n = 3 k + k log n

After the transformation, we can calculate the ratio of the time required to run the two different procedures:

(3 k + k log n)/(k log n) = (3 + log n)/(log n)

Resolving this equation for n = 10000000000000 we get the ratio that is equal to 16/13 or 1.230769. This means that on the next step the time was increased 1.230769 times in compare with the previous one. Now we can apply this ratio that we calculated to the time that we've got in the first run of the search-for-primes procedure.

By doing so, we receive 1.7097 or some value similar to that. It's easy to note that the actual time required for the second run of the procedure is slightly greater. Most likely, it's related to how the interpreter conducts operations on bigger numbers.

