(define (make-mobile left right)
  (list left right)
  )

(define (make-branch length structure)
  (list length structure)
  )

(define (left-branch mobile)
  (car mobile)
  )

(define (right-branch mobile)
  (cadr mobile)
  )

(define (branch-length branch)
  (car branch)
  )

(define (branch-structure branch)
  (cadr branch)
  )

(define (mobile? structure)
   (pair? structure)
   )
(define (branch? branch)
  (not (pair? (branch-length branch)))
  )


(define (total-weight mobile)
  (cond ((branch? mobile)
         (if (mobile? (branch-structure mobile))
             (total-weight (branch-structure mobile))
             (branch-structure mobile)))
        ((mobile? mobile)
          (+ (total-weight (left-branch mobile)) (total-weight (right-branch mobile))))
        (else 0)
        )
  )

(trace-entry total-weight)
(trace-entry mobile?)
(trace-entry branch?)
