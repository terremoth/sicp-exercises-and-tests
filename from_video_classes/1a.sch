(define y 10)

(define (d)(* 5 5))

(define (square x)(* x x))

(define square2 (lambda (x)(* x x)))

(define (average x y)
  (/ (+ x y) 2))

(define (mean-square x y)
  (average (square x)(square y)))

(define (abs x)
  (cond ((< x 0)(- x))
        ((= x 0) 0)
        ((> x 0) x)))

(define (abs2 x)
  (if (< x 0)
      ( - x)
      x))

(define (sqrt x)

  (define (improve guess)
    (average guess (/ x guess)))

  (define (good-enough? guess)
    (< (abs (- (square guess) x))
  .001))

  (define (try guess)
    (if (good-enough? guess)
        guess
        (try (improve guess))))

  (try 1))
