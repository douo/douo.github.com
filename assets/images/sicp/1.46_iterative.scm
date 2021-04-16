(define (iterative-improve good-enough? improve)
  (define (try x)
    (let ((next (improve x)))
      (if (good-enough? x next)
          next
          (try next)
          )
      )
    )
  try
  )

(define tolerance 0.00001)

(define (fixed-point f first-guest)
  ((iterative-improve
    (lambda (v1 v2)
      (< (abs (- v1 v2)) tolerance)
      )
    f
    ) first-guest)
  )
