(load "2.17_last-pair.scm")

(define (count-change amount coin-values)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (no-more? coin-values)) 0)
          (else (+ (count-change amount (except-first-denomination coin-values))
                   (count-change (- amount (first-denomination coin-values)) coin-values)
                   )
                )
          )
    )

(define (no-more? list)
  (null? list)
  )

(define (except-first-denomination list)
  (cdr list)
  )

(define (first-denomination list)
  (car list)
  )

(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))
