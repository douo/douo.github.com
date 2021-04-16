(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-rec term (next a) next b))
      )
  )

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* result (term a)))
        )
    )
  (iter a 1)
  )

(define (factorial n)
  (define (inc x) (+ x 1))
  (define (id a) a)
  (product id 1 inc n)
  )

(define (pi-prod n)
  (define (term n)
    (/
     (* (floor (/ (+ n 2) 2)) 2)
     (+ (* (floor (/ (+ n 1) 2)) 2) 1)
     1.0)
    )
  (define (inc x) (+ x 1))
  (* (product term 1 inc n) 4)
  )

