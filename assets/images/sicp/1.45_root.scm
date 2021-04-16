(load "1.43_repeated.scm")
(load "1.35_phi.scm")

(define (average-damp f)
  (lambda (x)
    (/ (+ (f x) x) 2)
    )
  )

;; (define (fixed-point f first-guest)
;;   (define (close-enough? v1 v2)
;;     (< (abs (- v1 v2)) tolerance)
;;     )
;;   (define (convergence? d1 d2) ;; 收敛？
;;     (if (= d1 0)
;;         true
;;         (> (abs d1) (abs d2))
;;         )
;;     )
;;   (define (try pre guest)
;;     (display pre)
;;     (newline)
;;     (let ((next (f guest)))

;;       (if (convergence? pre (- guest next))
;;           (if (close-enough? next guest)
;;               next
;;               (try (- guest next) next)
;;               )
;;           (error "Not convergence")
;;           )
;;       )
;;     )
;;   (try 0 first-guest)
;;   )


;; 开 n 次方根 a = logn/log2
(define (root n x a)
  (define (nroot y)
    (/ x (expt y (- n 1)))
    )
  (fixed-point
   ((repeated average-damp a) nroot)
   1.0)
  )



