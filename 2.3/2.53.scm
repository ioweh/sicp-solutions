
(list 'a 'b 'c) would print (a b c)
(list 'a 'b 'c)
;Value 2: (a b c)

(list (list 'george)) would print ((george))
(list (list 'george))
;Value 3: ((george))

(cdr '((x1 x2) (y1 y2))) would return a pair (y1 y2), probably an error, since y1 and y2 are not defined yet
(cdr '((x1 x2) (y1 y2)))
;Value 4: ((y1 y2))

Correction: it seems that quote applies to every nested expression in the quoted list. It would return a list,
since (y1 y2) is a list itself, and it is included into the cdr. So, the result is ((y1 y2))

(cadr '((x1 x2) (y1 y2))) would return a list (y1 y2)
(cadr '((x1 x2) (y1 y2)))
;Value 5: (y1 y2)

(pair? (car '(a short list))) would return #f, because the result of (pair? 'a) is false. It appears that 'a is an atom.
(pair? (car '(a short list)))
;Value: #f

memq
;Value 6: #[compiled-procedure 6 ("list" #x86) #x3 #x4a38c]

(memq 'red '((red shoes) (blue socks))) would return #f
(memq 'red '((red shoes) (blue socks)))
;Value: #f

(memq 'red '(red shoes blue socks)) would return (red shoes blue socks)
(memq 'red '(red shoes blue socks))
;Value 7: (red shoes blue socks)


