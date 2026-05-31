; Functions


;; =====================================================================
;; 1. BASIC NAMED FUNCTION (defun)
;; Syntax: (defun function-name (parameter-list) "Optional Docstring" body)
;; =====================================================================
(format t "--- 1. Basic Named Functions ---~%")

(defun greet-user (username)
  "Prints a simple welcome message to the console."
  (format t "Hello, ~A! Welcome to the Lisp environment.~%" username))

;; Calling the function
(greet-user "Alex")
(format t "~%")


;; =====================================================================
;; 2. OPTIONAL PARAMETERS (&optional)
;; If the caller doesn't supply an optional argument, it defaults to NIL
;; unless you explicitly provide a fallback default value.
;; =====================================================================
(format t "--- 2. Optional Parameters ---~%")

(defun calculate-total (price &optional (tax-rate 0.12))
  "Calculates final price with a default tax rate of 12% if omitted."
  (+ price (* price tax-rate)))

;; Call with only the required argument (uses 0.12 tax default)
(format t "Default Tax Total (100): ~A~%" (calculate-total 100))

;; Call with custom optional argument supplied (uses 0.05 tax)
(format t "Custom Tax Total (100 at 5%): ~A~%~%" (calculate-total 100 0.05))


;; =====================================================================
;; 3. KEYWORD PARAMETERS (&key)
;; Keywords allow parameters to be passed in any order by specifying their name.
;; They make complex code much more readable.
;; =====================================================================
(format t "--- 3. Keyword Parameters ---~%")

(defun display-profile (&key name role department)
  (format t "Employee: ~A~%" name)
  (format t " Position: ~A~%" role)
  (format t " Dept: ~A~%" department))

;; Order does not matter when calling with keywords!
(display-profile :department "Engineering" :name "Devin" :role "QA Intern")
(format t "~%")


;; =====================================================================
;; 4. ANONYMOUS FUNCTIONS & HIGHER-ORDER FUNCTIONS (lambda)
;; A 'lambda' is a function without a name. You can use the 'function' 
;; operator (or the short-hand #') to pass functions into mappings.
;; =====================================================================
(format t "--- 4. Lambda and Higher-Order Functions ---~%")

(defparameter *numbers-list* '(1 2 3 4 5))

;; Using mapcar (Lisp's map function) with an anonymous lambda function
;; to square every item in our array/list:
(defparameter *squared-numbers* (mapcar #'(lambda (x) (* x x)) *numbers-list*))

(format t "Original List: ~A~%" *numbers-list*)
(format t "Squared List:  ~A~%~%" *squared-numbers*)


;; =====================================================================
;; 5. THE 'FUNCALL' OPERATOR
;; If you store a function inside a variable, you execute it using 'funcall'.
;; =====================================================================
(format t "--- 5. Executing Functions via Variables ---~%")

;; Store a reference to our multiplier lambda inside a parameter
(defparameter *triple-multiplier* #'(lambda (n) (* n 3)))

;; Execute the variable bound function using funcall
(format t "Result of dynamic funcall: ~A~%" (funcall *triple-multiplier* 10))