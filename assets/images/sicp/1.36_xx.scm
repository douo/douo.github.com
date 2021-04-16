(load "1.35_phi.scm")

(define (puts n step)
  (display step)
  (display ":")
  (display n)
  (newline)
  )

(define tolerance 0.00001)

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance)
  )

(define (fixed-point f first-guest)
  (define (try guest step)
    (let ((next (f guest)))
      (puts next step)
      (if (close-enough? next guest)
          next
          (try next (+ step 1))
          )
      )
    )
  (try first-guest 1)
  )


(define (average x y)
  (/ (+ x y) 2)
  )

(define (search f neg pos step)

  (let ((midpoint (average neg pos)))

    (if (close-enough? neg pos)
        midpoint
        (let ((test-value (f midpoint)))
          (puts test-value step)
          (cond ((negative? test-value)
                 (search f midpoint pos (+ step 1)))
                ((positive? test-value)
                 (search f neg midpoint (+ step 1)))
                (else midpoint)
                )
          )
        )
    )
  )

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value)
                (positive? b-value))
           (search f a b 1)
           )
          ((and (negative? b-value)
                (positive? a-value))
           (search f b a 1)
           )
          (else (error "Values are not of opposite sign" a b))
          )
    )
  )


(define (x1000a) ;; 34
  (fixed-point
   (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2))
   2.0
   )
  )

(define (x1000) ;; 34
  (fixed-point
   (lambda (x) (/ (log 1000) (log x)))
   2.0
   )
  )
;; 平均阻尼：方程两边加上 y 再同时除以 2
(define (x1000a) ;; 9
  (fixed-point
   (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2))
   2.0
   )
  )



(define (x1000s) ;; 27
  (half-interval-method
   (lambda (x) (- (/ (log 1000) (log x)) x))
   2.0 1000.0
   )
  )
