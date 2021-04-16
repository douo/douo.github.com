(define (puts n step)
  (display step)
  (display ":")
  (display n)
  (newline)
  )


(define (cont-frag-r n d k)
  (define (cont c)
    (if (> c k)
        0
        (/ (n c) (+ (d c) (cont (+ c 1))))
        )
    )
  (cont 1)
  )


(define (cont-frag n d k)
  (define (iter c result)
    ;;(puts result (- k c))
    (if (= c 0)
        result
        (iter (- c 1) (/ (n c) (+ (d c) result)))
        )
    )
  (iter k 0)
  )



(/ 1.0 (cont-frag (lambda (i) 1.0)
                  (lambda (i) 1.0)
                  100
                  )
   )
