(load "1.35_phi.scm")

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x)) dx))
  )


(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))
    )
  )

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess)
  )


(define (cubic a b c)
  (newton-method
   (lambda (x)
     (+ (* x x x)
        (* a x x)
        (* b x)
        c
        )
     )
   1.0
   )
  )
