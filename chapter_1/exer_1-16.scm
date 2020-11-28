\; Exercise 1.16:
; Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation that (b^(n/2))^2 = (b^2)^(n/2), keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product ab^n is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)

; - - - - - - - - - - -

(define (square a) (* a a))

(define (even? n)
  (= (remainder n 2) 0)
)

(define (fast-expt-iter b n)

  (define (iter base counter product)
    (cond
      ; If expontent has reached zero, solution is product
      ((= counter 0)
        product
      )
      ; On even exponents square base and divide  exponent by two
      ((even? counter)
        (iter (square base) (/ counter 2) product)
      )
      ; On odd exponents multiply product by base and decrement counter
      (else
        (iter base (- counter 1) (* product base))
      )
    )
  )

  ; Start the iteration
  (iter b n 1)
)


; Test Cases

; 3^3 -> 27
(fast-expt-iter 3 3)

; 4^7 -> 16384
(fast-expt-iter 4 7)
