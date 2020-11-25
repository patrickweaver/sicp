; Exercise 1.8: Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value
; ((x / y^2) + 2y) / 3

; Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In 1.3.4 we will see how to implement Newton’s method in general as an abstraction of these square-root and cube-root procedures.)

; - - - - - - - - - - -

(define (average a b) (/ (+ a b) 2))

(define (square a) (* a a))

(define (cube a) (* a a a))

(define (good-enough? guess x)
  (= (improve guess x) guess)
)

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess)
      )
      3
  )
)

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)
  )
)

(define (cube-root x)
  (cube-root-iter 1.0 x))


(cube-root 27)
; 3

(cube-root 35029979648)
; 3272
