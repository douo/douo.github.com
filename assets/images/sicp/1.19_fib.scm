;; a = bq + aq + ap
;; b = bp + aq
;; T_{p'q'} = (T_{qp})^2
;; p' = p^2 + q^2
;; q' = (q^2 + 2pq)

(define (fib n)
  (define (iter a b p q count)
    (cond
     ((= count 0) b)
     ((even? count)
      (iter a b
            (calp p q)
            (calq p q)
            (/ count 2))
      )
     (else
      (iter (+ (* b q)
               (* a q)
               (* a p))
            (+ (* b p)
               (* a q))
            p
            q
            (- count 1)))
     )
    )
  (define (calp p q)
    (+ (* p p)
       (* q q))
    )
  (define (calq p q)
    (+ (* q q)
       (* 2 p q)))
  (iter 1 0 0 1 n)
  )

