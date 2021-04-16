(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))


(define (add n m)
  (lambda (f)
    (lambda (x)
      ((n f) ((m f) x)
       )
      )
    )
  )


(define (f x)
  (+ x 1)
  )


((two f) 10)


(((add one two) f) 10)
;; zero + one



;; (lambda (f)
;;   (lambda (x)
;;     ((m f) ((n f) x)
;;        )
;;     )
;;   )

;; one + 1



(lambda (f)
  (lambda (x)
    (f ((
         ((lambda (z) (lambda (x) (z x))))
         f
         )
        x
        )
       )
    )
  )

(lambda (f)
  (lambda (x)
    (f ((
         (lambda (x) (f x))
         )
        x
        )
       )
    )
  )

(lambda (f)
  (lambda (x)
    (f (f x))
    )
  )

;; zero + 1

(add-1 zero)

(lambda (f)
  (lambda (x)
    (f ((
         ((lambda (z) (lambda (x) x)))
         f
         )
        x
        )
       )
    )
 )



(lambda (f)
  (lambda (x)
    (f ((lambda (x) x)
        x
        )
       )
    )
  )


(lambda (f)
  (lambda (x)
    (f x)
    )
  )


