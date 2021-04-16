(define (double a)
  (+ a a)
  )

(define (halve a)
  (arithmetic-shift a -1)
  )
(define (even? n)
  (= (remainder n 2) 0)
  )
(define (mul b n)
  (cond
   ((= n 0) 0)
   ((even? n) (mul (double b) (halve n)))
   (else (+ b (mul b (- n 1))))
   )
  )

