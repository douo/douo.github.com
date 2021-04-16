;; 递归求解
(define (rf n)
  (if (< n 3)
      n
      (+
       (rf (- n 1))
       (* 2 (rf (- n 2)))
       (* 3 (rf (- n 3)))
       )
      )
  )

;; 迭代求解
(define (f n)
  (define (cf a b c n)
    (if (= n 0)
        c
        (cf
         (+ a (* 2 b) (* 3 c))
         a
         b
         (- n 1)
         )
        )
    )
  (cf 2 1 0 n)
  )

