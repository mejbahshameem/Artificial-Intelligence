(set-option :produce-models true)


;;; The universe (the elements)
(declare-datatypes () ((Element a b c d)))



;;; The predicates:
(declare-fun IsZero (Element) Bool)              ;; (IsZero x) should be true iff x is the zero element
(declare-fun Successor (Element Element) Bool)   ;; (Successor x y) should be true iff y is the successor of x (x is the predecessor of y)
(declare-fun Sum (Element Element Element) Bool) ;; (Sum x y z) should be true iff x+y=z
(declare-fun Predicate (Element) Bool)



;;; The formulas:


;;; (1) every element has exactly one successor
;;; TODO
(assert (forall ((x Element)) (exists ((y Element)) (and (Successor x y) (forall ((z Element)) (=> (Successor x z) (= z y) ) ) ) ) ) )

;;; (2) successor relation is asymmetric
;;; TODO Checked
(assert (forall ((x Element) (z Element)) (=> (Successor x z) (not (Successor z x)))))

;;; (3) there is exactly one zero element
;;; TODO
(assert (exists ((x Element)) (and (IsZero x) (forall ((y Element)) (=> (IsZero y) (= x y))))))

;;; (4) adding the zero element to any other element gives the element again
;;; TODO Checked
(assert (forall ((x Element) (y Element)) (=> (IsZero y) (Sum x y x))))

;;; (5) summing is commutative
;;; TODO Checked
(assert (forall ((x Element) (y Element) (z Element)) (=> (Sum x y z) (Sum y x z))))

;;; (6) summing two elements has at most one result
;;; TODO

(assert(forall((x Element)(y Element)) (or (not(exists((z Element)) (Sum x y z))) (exists((z Element)) (and (Sum x y z) (forall((w Element)) (=> (Sum x y w) (= w z))))))))

;;; (7) if element z is the sum of elements x y, x' is the successor of x, then
;;;     the successor of z is the result of the sum of x' and y
;;; TODO Checked
;  x' = w
(assert (forall ((x Element) (y Element) (z Element) (w Element)) (=> (and (Sum x y z) (Successor x w)) (exists ((m Element)) (and (Successor z m) (Sum w y m)))))) 

;;; (8) the predicate holds for an element iff it does not hold for its the successor
;;; TODO Checked
(assert (forall ((x Element) (y Element)) (=> (Successor x y) (and (=> (not (Predicate y)) (Predicate x)) (=> (Predicate x) (not (Predicate y)))))))

;;; (9) the zero element satisfies the predicate
;;; TODO Checked
(assert (forall ((x Element)) (=> (IsZero x) (Predicate x))))

;;; (10) the sum of every element whose by itself does not satisfy the predicate
(assert (exists ((x Element) (y Element)) (and (Sum x x y) (not (Predicate y)))))

(check-sat)