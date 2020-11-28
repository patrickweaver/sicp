#|
Exercise 1.11:
A function f is defined by the rule that f(n)=n if n<3 and f(n) = f(n−1) + 2f(n−2) + 3f(n−3) if n≥3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.
|#

; - - - - - - - - - - -

; Recursive
(define (f-recur n)
  (cond ((< n 3) n)
        (else
          (+  (f-recur (- n 1))
              (* 2 (f-recur (- n 2)))
              (* 3 (f-recur (- n 3)))
          )
        )
  )
)

; Iterative
(define (f-iter n)

  (define (iter x y z count)
    (if (= count 3)
        (+  (* x 2)
;           (* y 1)
            y
;           (* z 0)
        )
        (iter
              (+ y x)
              (+ z (* 2 x))
              (* 3 x)
              (- n 1)
        )
    )
  )

  (if (< n 3)
      n
      (iter 1 2 3 n)
  )
)


#|
1 -> 1
2 -> 2
3 -> f(2) + 2*f(1) + 3*f(0)
  -> 2 + 2 + 0
  -> 4
4 -> f(3) + 2 * f(2) + 3 * f(1)

  -> (f(2) + 2*f(1)) + 2*f(2) + 3*f(1)
  -> 3*f(2) + 5*f(1)
  -> 6 + 5 + 0
  -> 11

5 -> f(4)                   + 2*f(3) + 3*f(2)
  -> f(3) + 2*f(2) + 3*f(1) +
  -> 3*f(3) +
  -> 3*f(2) + 5*f(1) + 2*f(2) + 4*f(1) + 3*f(2)
  -> 8*f(2) + 9*f(1)
  -> 16 + 9
  -> 25
6 -> f(5) + 2*f(4) + 3*f(3)
  -> 8*f(2) + 9*f(1) + 6*f(2) + 10*f(1) + 3*f(2) + 6*f(1)
  -> 17*f(2) + 25*f(1)
  -> 34 + 25
  -> 59

|#

(f-iter 2)
(f-recur 2)
; 2
(f-iter 3)
(f-recur 3)
; 4
(f-iter 4)
(f-recur 4)
; 11
(f-iter 5)
(f-recur 5)
; 25
(f-iter 6)
(f-recur 6)
; 59
