(define (sqrt x)
  (sqrt-iter 1.0 x)
  )
(define (sqrt2 x)
  (sqrt-iter2 1.0 x x)
  )

(define (sqrt-iter n x)
  (if (good-enough? n x)
      n
      (sqrt-iter (improve n x) x)
      )
  )

(define (sqrt-iter2 n x m)
  (if (good-enough2? n m)
      n
      (sqrt-iter2 (improve n x) x n)
      )
  )


(define (improve n x)
  (average n (/ x n))
  )


(define (average a b)
  (/ (+ a b) 2)
  )


(define (good-enough? n x)
  (if (< (abs (- (* n n) x)) 0.001)
      true
      false)
  )


(define (good-enough2? n m)
  (if (< (/ (abs(- n m)) n) 0.001)
      true
      false)
)


(define (abs x)
  (if (< x 0)
      (- 0 x)
      x)
  )
