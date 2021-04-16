(load "2.9_width.scm")

(define (make-center-width c w)
  (make-interval (- c w) (+ c w))
  )

(define (center i)
  (/ (+ (upper-bound x) (lower-bound x)) 2)
  )

(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.0)))
  )
