(define (accumulate-rec combiner null-vaule term a next b)
  (if (> a b)
      null-vaule
      (combiner (term a)
                (accumulate combiner null-vaule term (next a) next b))
      )
  )
(define (accumulate combiner null-vaule term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))
        )
    )
  (iter a null-vaule)
  )

(define (sum term a next b)
  (accumulate + 0 term a next b)
  )


(define (product term a next b)
  (accumulate * 0 term a next b)
  )


