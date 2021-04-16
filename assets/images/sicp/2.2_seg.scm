(define (make-segment sp ep)
  (cons sp ep)
  )

(define (start-segment seg)
  (car seg)
  )


(define (end-segment seg)
  (cdr seg)
  )

(define (make-point x y)
  (cons x y)
  )

(define (x-point p)
  (car p)
  )


(define (y-point p)
  (cdr p)
  )

(define (midpoint-segment seg)
  (make-point
   (/ (+ (x-point (start-segment seg))
         (x-point (end-segment seg))
         ) 2)
   (/ (+ (y-point (start-segment seg))
         (y-point (end-segment seg))
         ) 2)
   )
  )

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  )


(define line (make-segment (make-point 0 0) (make-point 4 4)))

(print-point (midpoint-segment line))
