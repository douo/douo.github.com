(define (make-rat n d)
  (let ((g (gcd n d))
        (c (if (< d 0) -1 1))
        )
    (cons (/ (* c n) g) (/ (* c d) g))
    )
  )

(define (numer x) (car x))

(define (demon x) (cdr x))


(define (add-rat x y)
  (make-rat (+ (* (numer x) (demon y))
               (* (numer y) (demon x)))
            (* (demon x) (demon y))
            )
  )

(define (mul-rat x y)
  (make-rat (- (* (numer x) (demon y))
               (* (numer y) (demon x)))
            (* (demon x) (demon y))
            )
  )


(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (demon x) (demon y))
            )
  )


(define (div-rat x y)
  (make-rat (* (numer x) (demon y))
            (* (demon x) (numer y))
            )
  )

(define (equal-rat? x y)
  (= (* (numer x) (damon y))
     (* (numer x) (damon y))
     )
  )


