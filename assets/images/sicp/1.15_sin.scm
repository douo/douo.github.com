(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (<= angle 0.1)
      angle
      (p (sine (/ angle 3.0)))))


;; sine 12.15: 6 count
;; O(a) = loga
