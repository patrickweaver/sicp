; Exercise 1.3:
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (square a) (* a a))

(define (sum-of-squares a b) (+ (square a) (square b)))

(define (sum-of-squares-of-larger-two a b c)
  (if (> a b)
      (if (> b c)
          (sum-of-squares a b)
          (sum-of-squares a c)
      )
      (if (> a c)
          (sum-of-squares a b)
          (sum-of-squares b c)
      )
  )
)

 (sum-of-squares-of-larger-two 1 2 3) 
 ;Value: 13 
 (sum-of-squares-of-larger-two 1 1 1) 
 ;Value: 2 
 (sum-of-squares-of-larger-two 1 2 2) 
 ;Value: 8 
 (sum-of-squares-of-larger-two 1 1 2) 
 ;Value: 5 
 (sum-of-squares-of-larger-two 1 4 3) 
 ;Value: 25 