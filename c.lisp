; Conditionals

(defparameter *score* 85)
(defparameter *is-logged-in* t)

;; =====================================================================
;; 1. THE 'IF' STATEMENT
;; Syntax: (if condition then-clause else-clause)
;; =====================================================================
(format t "--- 1. Testing 'if' ---~%")

(if (>= *score* 75)
    (format t "Passed!~%")      ; Run if true
    (format t "Failed!~%"))     ; Run if false

;; Because 'if' returns a value, you can nest it inside an assignment:
(defparameter *status* (if *is-logged-in* "Welcome Back" "Please Log In"))
(format t "Status: ~A~%~%" *status*)


;; =====================================================================
;; 2. THE 'WHEN' & 'UNLESS' MACROS
;; Use these when you ONLY want a 'then' or ONLY an 'else', and need
;; to execute multiple lines of code.
;; =====================================================================
(format t "--- 2. Testing 'when' and 'unless' ---~%")

;; WHEN: Runs multiple statements only if the condition is TRUE
(when *is-logged-in*
  (format t "User session verified.~%")
  (format t "Loading profile dashboard...~%"))

;; UNLESS: Runs multiple statements only if the condition is FALSE
(unless (>= *score* 100)
  (format t "There is still room for improvement.~%~%"))


;; =====================================================================
;; 3. THE 'COND' MACRO (The Lisp Multi-way Switch/If-Else Ladder)
;; Syntax: (cond (condition1 execution1) (condition2 execution2) ...)
;; =====================================================================
(format t "--- 3. Testing 'cond' ---~%")

(cond
  ((>= *score* 90) (format t "Grade: A~%"))
  ((>= *score* 80) (format t "Grade: B~%"))
  ((>= *score* 70) (format t "Grade: C~%"))
  (t               (format t "Grade: F~%"))) ; 't' acts as the fallback 'else'

;; Like 'if', 'cond' also returns the value of the matching branch:
(defparameter *letter-grade*
  (cond
    ((>= *score* 90) "Excellent")
    ((>= *score* 80) "Good")
    (t               "Needs Work")))

(format t "Performance Evaluation: ~A~%~%" *letter-grade*)


;; =====================================================================
;; 4. THE 'CASE' MACRO (Equivalent to a Switch Statement)
;; Matches a single variable against exact values or keys literal-style.
;; =====================================================================
(format t "--- 4. Testing 'case' ---~%")

(defparameter *user-role* 'admin) ; Using a symbol

(case *user-role*
  (guest (format t "Read-only access.~%"))
  (user  (format t "Standard member access.~%"))
  (admin (format t "Full administrator access.~%"))
  (otherwise (format t "Unknown role access denied.~%")))


;; Cleanly terminate the evaluation script
(sb-ext:exit)