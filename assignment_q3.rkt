#lang racket


(define tree '(((() 1 ()) 2 (() 3 ())) 4 ((() 5 ()) 6 (() 7 ()))))

;A
;while the left child isnt null, print and pass in again to find right child if it exisits
(define (sorted_order tree)
  (begin
    (cond
      [(not (null? (car tree))) (sorted_order (car tree))])
      (printf "~a~n" (cadr tree))
    (cond 
      [(not (null? (caddr tree))) (sorted_order (caddr tree))]
      )))

  

;B
;checks if el is less than or greater than root, then traverses accordingly until value found
(define (search_tree el tree)
  (begin
    (cond
      [(null? tree)#f]
      [(equal? el (cadr tree))#t]
      [(< el (cadr tree)) (search_tree el (car tree))]
      [(> el (cadr tree)) (search_tree el (caddr tree))]
     )
    )
)

;C
;if empty create new empty tree, checks if value inserting is less/greater than, then inserts value accorsingly
(define (insert_el el tree)
    (cond
      [(null? tree) (list '() el '()) ]
      [(equal? el (cadr tree)) (printf "~a~n" tree)]
      [(< el (cadr tree)) (list (insert_el el (car tree)) (cadr tree) (caddr tree))]
      [(> el (cadr tree)) (list (car tree) (cadr tree) (insert_el el (caddr tree)))]
      )
  )

;D
(define (insert_list lst tree)
  ;couldnt get D fully working
  ;tried to say, if the list isnt empty, insert first element into tree then continue
  (if (null? lst) tree (insert_el (car lst) tree))
    
    )
  
;E
(define (tree_sort lst)
  ;i couldnt get part D fully working but i imagine this is how it would work
  (sorted_order(insert_list lst '()))
  )
