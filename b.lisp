;; Operators 
;; Define global parameters to use across tests
(defparameter *my-num* 50)
(defparameter *stack* '(2 3))

;; =====================================================================
;; 1. ARITHMETIC OPERATORS
;; =====================================================================
(format t "--- 1. Arithmetic Operators ---~%")

;; Standard Operators allow multiple arguments
(format t "Addition (+ 5 10 2): ~A~%" (+ 5 10 2))
(format t "Subtraction (- 20 5 2): ~A~%" (- 20 5 2))
(format t "Multiplication (* 2 3 4): ~A~%" (* 2 3 4))

;; Division returns an exact ratio by default
(format t "Division (/ 10 4): ~A~%" (/ 10 4))

;; Optimized Increments/Decrements (+1 and -1)
(format t "Increment (1+ 10): ~A~%" (1+ 10))
(format t "Decrement (1- 10): ~A~%~%" (1- 10))


;; =====================================================================
;; 2. COMPARISON OPERATORS
;; =====================================================================
(format t "--- 2. Comparison Operators ---~%")

;; Numeric Comparisons
(format t "Numeric Equality (= 5 5.0): ~A~%" (= 5 5.0))
(format t "Monotonically Increasing (< 1 3 5): ~A~%" (< 1 3 5))
(format t "Monotonically Decreasing (>= 10 5 5): ~A~%" (>= 10 5 5))

;; General Equality Checks
(format t "Pointer check (eq 'x 'x): ~A~%" (eq 'x 'x))
(format t "Same type check (eql 5 5.0): ~A~%" (eql 5 5.0))
(format t "Structural check (equal \"hi\" \"hi\"): ~A~%" (equal "hi" "hi"))
(format t "Flexible check (equalp 5 5.0): ~A~%~%" (equalp 5 5.0))


;; =====================================================================
;; 3. LOGICAL OPERATORS
;; =====================================================================
(format t "--- 3. Logical Operators ---~%")

(format t "Logical AND (and t t nil): ~A~%" (and t t nil))
(format t "Logical OR (or nil t nil): ~A~%" (or nil t nil))
(format t "Logical NOT (not t): ~A~%~%" (not t))


;; =====================================================================
;; 4. ASSIGNMENT & MODIFICATION OPERATORS
;; =====================================================================
(format t "--- 4. Assignment & Modification ---~%")

;; In-place mutation
(incf *my-num* 5)
(format t "After INCF by 5, *my-num* is: ~A~%" *my-num*)

(decf *my-num*)
(format t "After DECF by 1, *my-num* is: ~A~%" *my-num*)

;; List Stack manipulations
(push 1 *stack*)
(format t "After PUSH 1, *stack* is: ~A~%" *stack*)

(defparameter *popped-val* (pop *stack*))
(format t "Popped value: ~A, *stack* goes back to: ~A~%~%" *popped-val* *stack*)


;; =====================================================================
;; 5. BITWISE OPERATORS
;; =====================================================================
; (format t "--- 5. Bitwise Operators ---~%")

; (format t "Bitwise AND (logand #b1100 #b1010): ~B~%" (logand #b1100 #b1010))
; (format t "Bitwise OR  (logior #b1100 #b1010): ~B~%" (logior #b1100 #b1010))
; (format t "Bitwise XOR (logxor #b1100 #b1010): ~B~%" (logxor #b1100 #b1010))
; (format t "Arithmetic Shift Left (ash #b0010 1): ~B~%" (ash #b0010 1))

