(define (double f)
  (lambda (x)
    (f (f x)))
  )

(define (inc x)
  (+ x 1)
  )


;; 21
;; https://wizardbook.wordpress.com/2010/11/30/exercise-1-41
;; ((double (double double)) inc) = (double (double (double (double inc))))

;; ((double (double double)) inc)
;; (define four (double doule))
;; ((double four) inc)
;; (double four) = (four (four x))
;; (define sixteen (double four))

;;((sixteen-ply inc) 5)
;;(sixteen-ply inc) = (four-ply (four-ply inc))
;;(four-ply inc) = (double (double inc))
;;let y = (double (double inc))
;;(four-ply (four-ply inc)) = (double (double y))
;;(four-ply (four-ply inc)) = (double (double (double (double inc))))
;;(sixteen-ply inc) = (double (double (double (double inc))))
