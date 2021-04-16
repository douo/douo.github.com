(define (merge a b)
  (define (iter src a b)
    (if (null? a)
        (reverse src)
        (iter (cons (list (car a) (car b)) src) (cdr a) (cdr b))
        )
    )
  (iter () a b)
  )

(define (dot-product-old v w)
  (accumulate (lambda (pair result)
                (+ result (* (car pair) (cadr pair)))
                )
              0
              (merge v w))
  )

(define (dot-product v w)
  (accumulate + 0 (map * v w))
  )


(define (matrix-*-vector m v)
  (map (lambda (x)
         (dot-product v x))
       m)
  )


