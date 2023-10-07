; In this Lecture we see how different procedures which gives the same final result can lead
; to a different flow/process that the computer does, therefore, stimulates the computational thinking
; of the programmer to choose which/when one process is better than the other.
; The first way is using iteration, the second one, recursion, which uses more space and time to compute

(define (sos x y)
  (define (square x)(* x x))  
  (+ (square x)(square y)))

; Peanu Arithmetics

; Sum way 1
;(define (+ x y) (if (= x 0) y (inc (+ (dec x) y))) )

(+ 4 5) ; The process:
(if (= 4 0) 5 (inc (+ (dec 4) 5)))
(if (= 4 0) 5 (inc (+ 3 5)))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (+ (dec 3) 5)))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (+ 2 5)))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (+ (dec 2) 5)))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (+ 1 5)))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (if (= 1 0) 5 (inc (+ (dec 1) 5)))))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (if (= 1 0) 5 (inc (+ 0 5)))))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (if (= 1 0) 5 (inc  (if (= 0 0) 5 (inc (+ (dec 0) 5)))))))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (if (= 1 0) 5 (inc  5))))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc (if (= 1 0) 5 6)))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 (inc 6))))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc (if (= 2 5) 5 7)))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 (inc 7))))
(if (= 4 0) 5 (inc (if (= 3 0) 5 8)))
(if (= 4 0) 5 (inc 8))
(if (= 4 0) 5 9)
9

; --------------------------------------------------------------------------------

; Sum way 2
;(define (+ x y) (if (= x 0) y (+ (dec x)(inc y))) )

(+ 4 5) ; The process:
(if (= 4 0) 5 (+ (dec 4)(inc 5)))
(if (= 4 0) 5 (+ 3 6))
(+ 3 6)
(if (= 3 0) 6 (+ (dec 3)(inc 6)))
(if (= 3 0) 6 (+ 2 7))
(+ 2 7)
(if (= 2 0) 7 (+ (dec 2)(inc 7)))
(if (= 2 0) 7 (+ 1 8))
(+ 1 8)
(if (= 1 0) 8 (+ (dec 1)(inc 8)))
(if (= 1 0) 8 (+ 0 9))
(+ 0 9)
(if (= 0 0) 9 (+ (dec 0)(inc 9)))
9

; The simple way to calculate Fibonacci numbers uses recursion and creates 2 trees which is very non-performatic
(define (fib n)
  (if (< n 2) n
      (+ (fib (- n 1))
         (fib (- n 2)))))
