(load "1.17_mul.scm")

(define (square b)
  (mul b b)
  )

(define (iexpt b n)
  (define (iter a b n)
    (cond
     ((= n 1)  (mul a b))
     ((even? n)
      (iter a (square b) (/ n 2))
      )
     (else
      (iter (mul a b) b (- n 1))
      )
     )
    )
  (cond
   ((= n 0) 1)
   ((= n 1) b)
   (else (iter 1 b n))
   )
  )

