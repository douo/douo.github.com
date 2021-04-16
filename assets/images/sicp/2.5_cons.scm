(define (cons x y)
  (* (expt 2 x)
     (expt 3 y))
  )

(define (car z)
  (define (iter result z)
    (if (= (remainder z 2) 0)
        (iter (+ result 1)
              (/ z 2)
              )
        result
        )
    )
  (iter 0 z)
  )


(define (cdr z)
  (define (iter result z)
    (if (= (remainder z 3) 0)
        (iter (+ result 1)
              (/ z 3)
              )
        result
        )
    )
  (iter 0 z)
  )
