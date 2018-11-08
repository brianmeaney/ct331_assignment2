#lang racket

(require (file "assignment_q2.rkt")
         (file "assignment_q3.rkt"))

(define (runTests)
  (begin
    (display "Running tests...\n")
    (printf "Testing Insert Beginning: ~a\n" (test_ins_beg1))
    (printf "Testing Insert End: ~a\n" (test_ins_end))
    (printf "Testing Count Top Level: ~a\n" (test_count_top_level))
    (printf "Testing Instances: ~a\n" (test_count_instances))
    (printf "Testing Instances Tail Recursion: ~a\n" (test_count_instances))
    (printf "Testing Instances Deep: ~a\n" (test_count_instances_deep))
    (display "\nTests complete!\n")))

;Begin test functions
(define (test_ins_beg1)
  (equal? '(1 2 3 4)(ins_beg 1 '(2 3 4))))

(define (test_ins_end)
  (equal? '(2 3 4 1)(ins_end 1 '(2 3 4))))

(define (test_count_top_level)
  (equal? 3(count_top_level '(2 3 4))))

(define (test_count_instances)
  (equal? 2(count_instances 2 '(2 2 4))))

(define (test_count_instances_tr)
  (equal? 2(count_top_level 2 '(2 2 4))))

(define (test_count_instances_deep)
  (equal? 3(count_instances_deep 2 '('(2 2 4) 2))))

(runTests)