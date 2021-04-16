(define (cons x y)
  (display "cons")
  (lambda (m) (m x y))
  )

(define (car z)
  (display "car")
  (z (lambda (p q) p))
  )


(define (cdr z)
  (display "cdr")
  (z (lambda (p q) q))
  )
