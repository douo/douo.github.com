(define (reverse list)
  (define (iter list result)
    (if (null? list)
        result
        (iter (cdr list) (cons (car list) result))
        )
    )
  (iter list ())
  )


(define (deep-reverse items)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items)
              (cons
               (let ((v (car items)))
                 (if (pair? v)
                     (deep-reverse v)
                     v))
               result))
        )
    )
  (iter items ())
  )
