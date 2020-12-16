(define (split-at lst n)
  'YOUR-CODE-HERE
  (cond
    ((= n 0) (cons lst nil))
    ((null? lst) nil)
    ((= n 1) (cons (car lst) (cdr lst)))
    (else (cons (cons (car lst) (car (split-at (cdr lst) (- n 1)))) (cdr (split-at (cdr lst) (- n 1)))))
      )
)


(define (compose-all funcs)
  'YOUR-CODE-HERE
  (define (helper funcs arg)
      (if (null? funcs) arg
          (helper (cdr funcs) ((car funcs) arg))
      ))
  (lambda (x) (helper funcs x))
)

