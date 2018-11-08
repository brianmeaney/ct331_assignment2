#lang racket

(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

;A
(define (ins_beg el lst)
  (cons el lst)
  )

;B
(define (ins_end el lst)
  (append lst (list el))
  )

;C
(define (count_top_level lst)
  (if (null? lst)0
      (+ 1 (count_top_level (cdr lst)))))

;D
(define (count_instances el lst)
   (cond [(null? lst) 0]
         [(equal? el (car lst))
         (+ 1 (count_instances el (cdr lst)))]
         [else (count_instances el (cdr lst))]))

;E
(define (tail el lst)
  (count_instances_tr el lst 0))
  
(define (count_instances_tr el lst num)
  (cond ((null? lst) num)
         ((equal? el (car lst))
         (count_instances_tr el (cdr lst) (+ 1 num)))
         (else (count_instances_tr el (cdr lst) num))))

;F
(define (count_instances_deep el lst)
  (cond ((null? lst) 0)
        ((equal? el (car lst))
         (+ 1 (count_instances_deep el (cdr lst))))
        ((list? (car lst))
         (+ 0 (count_instances_deep el (cdr lst))
             (count_instances_deep el (car lst))))
        (else (count_instances_deep el (cdr lst)))))
    