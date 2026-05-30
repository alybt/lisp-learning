;; Data Types

;; Single line comments start with a semicolon, and can start at any point in the line


#|
  This is a multi-line comment.

  #|
    They can be nested!
  |#
|#


;; ~A :     Aesthetic:   Prints strings without quotes, chars without #\, and lists cleanly.
;; ~S :      Standard:   Prints things exactly how you would type them into code (great for debugging).
;; ~D :       Decimal:   Strictly forces the output to look like a base-10 integer.
;; ~% :      New Line:   Moves the cursor to the next line (like \n in other languages).



; define variables and set values
;; ==========================================
;; 1. INTEGER
;; ==========================================
(defparameter *my-int* 42)

;; Print the value and its type
(format t "Value: ~A, Type: ~A~%" *my-int* (type-of *my-int*))
; (format t "Value: ~D, Type: ~D~%" *my-int* (type-of *my-int*))
;; Output: Value: 42, Type: FIXNUM (a fast, optimized integer)


;; ==========================================
;; 2. STRING
;; ==========================================
(defparameter *my-string* "Hello, world!")

(format t "Value: ~A, Type: ~A~%" *my-string* (type-of *my-string*))
;; Output: Value: Hello, world!, Type: (SIMPLE-ARRAY CHARACTER (13))
;; (Note: In Lisp, a string is structurally an array of characters)


;; ==========================================
;; 3. BOOLEAN
;; ==========================================
(defparameter *my-bool* t)

(format t "Value: ~A, Type: ~A~%" *my-bool* (type-of *my-bool*))
;; Output: Value: T, Type: BOOLEAN


;; ==========================================
;; 4. CHARACTER
;; ==========================================
(defparameter *my-char* #\A)

(format t "Value: ~A, Type: ~A~%" *my-char* (type-of *my-char*))
;; Output: Value: A, Type: STANDARD-CHAR

;; =====================================================================
;; 5. LISTS (A linked sequence of data)
;; =====================================================================
(defparameter *my-list* '(10 20 30))

(format t "Value: ~A, Type: ~A~%" *my-list* (type-of *my-list*))
;; Output: Value: (10 20 30), Type: CONS
;; (Note: 'CONS' refers to a cons cell, the foundational building block of Lisp lists)


;; =====================================================================
;; 6. VECTORS (A fixed-size array, similar to standard arrays in arrays)
;; =====================================================================
(defparameter *my-vector* #(1 2 3))

(format t "Value: ~A, Type: ~A~%" *my-vector* (type-of *my-vector*))
;; Output: Value: #(1 2 3), Type: (SIMPLE-ARRAY T (3))
;; (Note: This means it's a simple array containing any type 'T', with a size of 3)


;; =====================================================================
;; 7. HASH TABLES (Key-Value Dictionary / Map)
;; =====================================================================
(defparameter *my-hash* (make-hash-table))
;; Let's add a quick value so it isn't empty
(setf (gethash 'id *my-hash*) 101)

(format t "Value: ~A, Type: ~A~%" *my-hash* (type-of *my-hash*))
;; Output: Value: #<HASH-TABLE ...>, Type: HASH-TABLE
;; (Note: Hash tables print with special #<...> syntax because they are complex objects)


;; =====================================================================
;; 8. CUSTOM STRUCTURES (User-defined record / objects)
;; =====================================================================
;; First, we define what the structure looks like:
(defstruct user name role)

;; Now, we instantiate it using defparameter:
(defparameter *current-user* (make-user :name "Alex" :role "Admin"))

(format t "Value: ~A, Type: ~A~%" *current-user* (type-of *current-user*))
;; Output: Value: #S(USER :NAME "Alex" :ROLE "Admin"), Type: USER
;; (Note: Lisp recognizes 'USER' as its own unique, distinct data type!)

