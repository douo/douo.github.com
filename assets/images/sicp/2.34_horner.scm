(load "2.33_accumulate.scm")

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coefficient high-term)
                (+ (* high-term x) this-coefficient)
                )
              0
              coefficient-sequence)
  )

(horner-eval 2 (list 1 3 0 5 0 1))
