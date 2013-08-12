
(load "2.69.scm")
;Loading "2.69.scm"... 
;  Loading "huffman.scm"... done
;... done
;Value 2: ((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8)

(load "2.68.scm")
;Loading "2.68.scm"... 
;  Loading "huffman.scm"... done
;the symbol doesn't belong to the tree -- ENCODE-SYMBOL l
;To continue, call RESTART with an option number:
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n): n

(load "huffman.scm")
;  Loading "huffman.scm"... done
;Value: sample-message

(define pairs
  '((NA 16) (YIP 9) (SHA 3) (GET 2) (JOB 2) (A 2) (BOOM 1) (WAH 1)))
;Value: pairs

(define rock-songs
  (generate-huffman-tree pairs))
;Value: rock-songs

rock-songs
;Value 5: ((leaf na 16) ((leaf yip 9) ((leaf sha 3) ((leaf get 2) ((leaf job 2) ((leaf a 2) ((leaf boom 1) (leaf wah 1) (boom wah) 2) (a boom wah) 4) (job a boom wah) 6) (get job a boom wah) 8) (sha get job a boom wah) 11) (yip sha get job a boom wah) 20) (na yip sha get job a boom wah) 36)

(encode '(Get a job) rock-songs)
;Value 7: (1 1 1 0 1 1 1 1 1 0 1 1 1 1 0)

(decode '(1 1 1 0 1 1 1 1 1 0 1 1 1 1 0) rock-songs)
;Value 9: (get a job)

(encode '(Sha na na na na na na na na) rock-songs)
;Value 10: (1 1 0 0 0 0 0 0 0 0 0)

(decode '(1 1 0 0 0 0 0 0 0 0 0) rock-songs)
;Value 11: (sha na na na na na na na na)

(encode '(get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom) rock-songs)
;Value 12: (1 1 1 0 1 1 1 1 1 0 1 1 1 1 0 1 1 0 0 0 0 0 0 0 0 0 1 1 1 0 1 1 1 1 1 0 1 1 1 1 0 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 0 1 1 1 1 1 1 0)

87 bits are required for the encoding. If we used a fixed-length code, we would need 108 bits for the eight-symbol alphabet, as we would need 3 bits per one symbol (log2 8 = 3). The total amount of symbols is 36, so the total amount of bits is (* 36 3)
;Value: 108

We can see the profits of using the huffman encoding tree.
