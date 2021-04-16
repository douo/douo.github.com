(load "2.8_sub-interval.scm")

(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2)
  )



;; w_a = (l_a - u_a)/2
;; w_b = (l_b - u_b)/2
;; w_(a+b) = (l_a - u_a)/2 + (l_b - u_b)/2
;; w_(a+b) = ((l_a + l_b) - (u_a + u_b))/2
