(define (tan-cf x k)
  (define (iter c result)
    (if (= c 0)
        result
        (iter (- c 1)
              (- (- (* c 2) 1)
                 (/ (* x x) result))
              )
        )
    )
  (/ x
     (iter k 1)
     )
)
