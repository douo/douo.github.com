(define (expt b n)
  (cond
   ((= n 0) 1)
   ((even? n) (expt (square b) (/ n 2)))
   (else (* b (expt b (- n 1)))))
)

(define (even? n)
  (= (remainder n 2) 0)
  )


(define (iexpt b n)
  (define (iter a b n)
    (cond
     ((= n 1)  (* a b))
     ((even? n)
      (iter a (square b) (/ n 2))
      )
     (else
      (iter (* a b) b (- n 1))
      )
     )
    )
  (cond
   ((= n 0) 1)
   ((= n 1) b)
   (else (iter 1 b n))
   )
  )
