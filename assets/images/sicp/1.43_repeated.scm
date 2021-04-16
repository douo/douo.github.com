(define (repeated-r f n)
  (if (= n 1)
      f
      (lambda (x)
        (f ((repeated f (- n 1)) x))
        )
      )
  )

(load "1.42_compose.scm")
(define (repeated f n)
  (define (iter f g n)
    (if (= n 1)
        g
        (iter f (compose f g) (- n 1))
        )
    )
  (iter f f n)
  )




