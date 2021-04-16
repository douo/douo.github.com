(load "1.23_odd_next.scm")
(load "1.20_gcd.scm")

(define (filtered-accumulate-rec combiner null-vaule term a next b filter?)
  (if (> a b)
      null-vaule
      (combiner
       (if (filter? a) (term a) null-vaule)
       (filtered-accumulate-rec combiner null-vaule term (next a) next b filter?))
      )
  )

(define (filtered-accumulate combiner null-vaule term a next b filter?)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (filter? a)
                  (combiner (term a) result)
                  result
                  )
              )
        )
    )
  (iter a null-vaule)
  )

;; a b 间素数的和
(define (acc-prime a b)
  (define (id x) x)
  (define (inc x) (+ x 1))
  (filtered-accumulate + 0 id a inc b prime?)
  )

(define (prod-prime-to n)
  (define (prime-to-n? a)
    (= (gcd a n) 1)
    )
  (define (id x) x)
  (define (inc x) (+ x 1))
  (filtered-accumulate * 1 id 1 inc n prime-to-n?)
  )


