;; x = 1 + 1/x
;; x^2 - x -1 = 0
;; (1+ exp(5))/2 = phi


(define tolerance 0.00001)

(define (fixed-point f first-guest)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance)
    )
  (define (try guest)
    (let ((next (f guest)))
      (if (close-enough? next guest)
          next
          (try next)
          )
      )
    )
  (try first-guest)
)


(define phi
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0
               )
  )
