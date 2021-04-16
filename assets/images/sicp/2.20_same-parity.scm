(define (same-parity f . l)
  (define (iter l predicate result)
    (if (null? l)
        result
        (if (predicate (car l))
            (iter (cdr l) predicate
                  (append result (list (car l))))
            (iter (cdr l) predicate result)
            )
        )
    )
      (if (= (remainder f 2) 0)
          (iter l (lambda (x) (= (remainder x 2) 0)) (list f))
          (iter l (lambda (x) (= (remainder x 2) 1)) (list f))
          )
      )
 


