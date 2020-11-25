; Exercise 1.7:
; The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

; - - - - - - - - - - -

(define (average a b) (/ (+ a b) 2))

(define (square a) (* a a))

(define (good-enough? guess x)
  (< (abs (- (square guess) x))
      0.001
  )
)

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; With very small numbers the difference in good-enough? is too coarse to keep the procedure recursing enough times. The hard-coded proximity would need to be smaller than the root.

(sqrt 0.0001)
; 0.01

(sqrt 1000000000000)
; 1000000

; With very large numbers the procedure never terminates because each improvement will return the same guess as before, even if it is not within the hard coded proximity. Instead, we can recurse until it does return the same guess, which means it is as close as it can get.

; Uncomment below to run, won't terminate
; (sqrt 10000000000000)
; 3162277.66016838

(define (good-enough? guess x)
  (= (improve guess x) guess))
)

(sqrt 0.0001)
; 0.01

(sqrt 10000000000000)
; 3162277.66016838
