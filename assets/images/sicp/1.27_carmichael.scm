(load "1.25_expmod.scm")


(define (expmod_prime? n)
  (define (iter n count)
    (cond ((= count n) (display "yep!"))
          ((= (expmod count n n) count)
           (iter n (+ count 1)))
          (else (display "non!"))
        )
    )
  (iter n 1)
  )

