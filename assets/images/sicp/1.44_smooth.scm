(load "1.43_repeated")
(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (+ x dx))
          (f x)
          (f (- x dx)))
       3
       )
    )
  )


(define (nsmooth f n)
  (lambda (x)
    ((repeated (smooth f) n) x)
    )
  )


