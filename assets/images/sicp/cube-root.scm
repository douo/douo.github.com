(define (cube-root x)
  (cube-root-iter 1.0 x x)
  )

(define (cube-root-iter n x m)
  (if (good-enough? n m)
      n
      (cube-root-iter (improve n x) x n)
      )
  )

(define (improve y x)
  (/
   (+
    (/ x (* y y))
    (* 2 y))
   3)
  )


(define (good-enough? n m)
  (if (< (/ (abs(- n m)) n) 0.001)
      true
      false)
  )



(define (abs x)
  (if (< x 0)
      (- 0 x)
      x)
  )
