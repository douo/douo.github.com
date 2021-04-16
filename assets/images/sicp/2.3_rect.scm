(load "2.2_seg.scm")


(define (area rect)
  (* (x-edge rect)
     (y-edge rect)
   )
  )

(define (perimeter rect)
  (* (+ (x-edge rect)
     (y-edge rect)
     ) 2)
  )

(define (make-rect left right top bottom)
  (cons (make-point left bottom)
        (make-point right top))
  )


(define (x-edge rect)
  (abs (- (x-point (car rect))
     (x-point (cdr rect))
     ))
  )


(define (y-edge rect)
  (abs (- (y-point (car rect))
          (y-point (cdr rect))
          ))
  )
