#|
Exercise 1.12:
The following pattern of numbers is called Pascal’s triangle.

          1
        1   1
      1   2   1
    1   3   3   1
  1   4   6   4   1
1   5   10  10  5   1
       . . .
The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.

|#


(define (pascal-triangle row col)
  (cond ((= row 1) 1)
        ((= col 1) 1)
        ((= row col) 1)
        (else (+ (pascal-triangle (- row 1) col)
                 (pascal-triangle (- row 1) (- col 1))
              )
        )
  )
)

(pascal-triangle 5 3)
; 6
(pascal-triangle 6 3)
; 10
(pascal-triangle 6 4)
; 10
