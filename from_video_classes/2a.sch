; This lecture is intended to explain high order procedures and how the abstraction
; can help to deal with similar or equal processes when programming
; the first example shows the sum of integers function and sum of squares, showing how similar they look like

(define (square x)(* x x))

(define (sum-int a b)
  (if (> a b)
      0
      (+ a (sum-int (inc a) b))))

(define (sum-sq a b)
  (if (> a b)
      0
      (+ (square a)
         (sum-sq (inc a) b))))

; Leibnitz formula for finding pi over "a"
(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))

; This is the abstraction:
; (define (<name> a b)
;  (if (> a b)
;      0
;      (+ (<term> a)
;         (<name> (<next> a) b))))

; This is the implementation of the abstraction
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term
              (next a) next b))))

; Now implement the other 3 function with the implementation abstraction:

(define (sum-int2 a b)
  (define (identity x) x)
  (sum identity a inc b))

(define (sum-sq2 a b)
  (sum square a inc b))

(define (pi-sum2 a b)
  (sum (lambda (i)(/ 1 (* a (+ a 2))))
       a
       (lambda (i)(+ i 4))
       b))

;-------------------------------------------------------------

; Iterative version of "sum" function:

(define (sum-ite term a next)
  (define (iter j ans)
    (if (> j a)
        ans
        (iter (next j)
              (+ (term j) ans))))
  (iter a 0))


; Heron of Alexandria "how to calculate square root of a number" algorithm

(define (average x y)(/(+ x y) 2))

(define (sqrt x)  

  (define tolerance 0.000001)

  (define (good-enough? y)
    (< (abs (- (* y y) x)) tolerance))

  (define (improve y)
    (average (/ x y) y))

  (define (try y)
    (if (good-enough? y)
        y
        (try (improve y))))
  (try 1))


; Fixed point example

; average-dump is just a helper procedure
(define average-damp
    (lambda(f)
      (lambda(x)(average(f x) x))))

; Fixed point procedures tries to find the ?

(define (fixed-point f start)          
  (define (iter old new)
    (if (close-enough? old new)
        new
        (iter new (f new))))
  
  (iter start (f start)))

; A simpler way to solve square root using both functions
(define (sqrt-fixed-point x)
  (fixed-point (average-damp (lambda(y)(/ x y))) 1))

; Newton's method to find square root:
; "To find a Y such that f(y) = 0, start with a guess, y0, and then iterate the expression
; yn + 1 = yn - (f(yn) / df/dy | y = yn)

(define dx .000001)

(define derive
  (lambda(f)
    (lambda(x)
      (/ (- (f (+ x dx))
            (f x))
         dx))))

(define (newton f guess)
  (define derivative-of-f (deriv f))
  (fixed-point
   (lambda(x)(- x (/ (f x)(df x))))
     guess))

(define (sqrt-newton x)
  (newton (lambda(y)(- x (square y)))
          1))
