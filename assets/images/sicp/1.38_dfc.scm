(load "1.37_cont-frac.scm")

(+ (cont-frag (lambda (i) 1.0)
           (lambda (i)
             (if (= (remainder (+ i 1) 3) 0)
                 (* 2 (/ (+ i 1) 3))
                 1
                 )
             )
           200)
2)
