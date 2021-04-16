(define (smallest-divisor n)
  (find-divisor n 2)
  )

(define (find-divisor n test-divisor)
  (define (next n)
    (if (= n 2)
        3
        (+ n 2)
        )
    )
  (cond
   ((> (square test-divisor) n) n)
   ((divides? n test-divisor) test-divisor)
   (else (find-divisor n (next test-divisor)))
   )
  )
(define (divides? n divisor)
  (= (remainder n divisor) 0)
  )

(define (prime? n)
  (if (= n 1) false
      (= (smallest-divisor n) n)
      )
  )

