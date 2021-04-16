(define (square-tree tree)
  (cond ((null? tree) ())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))
        )
  )


(define (map proc tree)
  (cond ((null? tree) ())
        ((not (pair? tree)) (proc tree))
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))
        )
  )

(define (square-tree-ho tree)
  (map (lambda (x) (square x)) tree)
  )
