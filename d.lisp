;; =====================================================================
;; EXCEPTIONS / CONDITION HANDLING DEMONSTRATION
;; File: Add this right before (sb-ext:exit) in your script
;; =====================================================================

;; =====================================================================
;; 1. THE 'HANDLER-CASE' MACRO (Equivalent to Try-Catch)
;; Use this when you want to catch an error and return a safe alternative value
;; or execute recovery code.
;; =====================================================================
(format t "--- 1. Testing 'handler-case' (Try/Catch) ---~%")

(defun safe-divide (numerator denominator)
  (handler-case
      (/ numerator denominator)
    ;; Catch the specific division-by-zero error
    (division-by-zero (error-obj)
      (format t "Caught an error: ~A~%" error-obj)
      nil))) ; Return NIL as a fallback safe value

(format t "Successful Division: ~A~%" (safe-divide 10 2))
(format t "Dangerous Division Result: ~A~%~%" (safe-divide 10 0))


;; =====================================================================
;; 2. THE 'IGNORE-ERRORS' MACRO (The Quick Silencer)
;; Use this when you don't care about handling the error specifically, 
;; you just want to prevent the application from crashing. It returns NIL 
;; and the error object if a crash happens.
;; =====================================================================
(format t "--- 2. Testing 'ignore-errors' ---~%")

(defparameter *parsed-value* (ignore-errors (/ 100 0)))

(format t "Ignore-errors output: ~A~%~%" *parsed-value*) ; Prints NIL instead of crashing


;; =====================================================================
;; 3. THE 'UNWIND-PROTECT' MACRO (Equivalent to Try-Finally)
;; Guarantees that cleanup code runs NO MATTER WHAT, even if an unexpected
;; error happens in the middle of execution. Essential for closing databases or connections.
;; =====================================================================
(format t "--- 3. Testing 'unwind-protect' (Try/Finally) ---~%")

(handler-case
    (unwind-protect
         (progn
           (format t "Opening database connection connection...~%")
           (error "Database timeout failure!")) ; Simulating a crash
      ;; This cleanup block WILL run regardless of the crash above
      (format t "CLEANUP: Safely closing database connection anyway.~%~%"))
  ;; Silently handle the simulated error so the rest of the script finishes
  (error (e) nil))


;; =====================================================================
;; 4. SIGNALING CUSTOM ERRORS
;; Use 'error' to completely halt execution (unless caught), or 'warn'
;; to print a non-crashing warning banner.
;; =====================================================================
(format t "--- 4. Signaling Custom Errors & Warnings ---~%")

;; A Warning doesn't break code flow
(warn "This is a non-breaking developer system warning notice!")

;; An Error breaks code execution immediately unless trapped in a handler-case
(defun check-age (age)
  (if (< age 18)
      (error "Access Denied: Age ~D is under the required minimum threshold!" age)
      (format t "Access Granted.~%")))

(handler-case
    (check-age 15)
  (error (msg) (format t "Trapped custom error message: ~A~%" msg)))