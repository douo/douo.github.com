(define (expmod base exp m)
  ;; 找出 a 是否是 1 取模 n 的非平凡平方根
  (define (test a n) ;; 1 < a < n -1  and  a^2 mod n = 1
    (if (and (> a 1) (< a (- n 1)) (= a 1))
        0
        a))
  (cond
   ((= exp 0) 1)
   ((even? exp)
    (test (remainder (square (expmod base (/ exp 2) m)) m) m))
   (else
    (remainder (* base (expmod base (- exp 1) m)) m))
   )
  )

(define (mr-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1)
    )
  (try-it (+ (random (- n 2)) 1))
  )

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((mr-test n) (fast-prime? n (- times 1)))
        (else false)
        )
  )
