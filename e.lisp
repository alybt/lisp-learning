;; OOP

;; =====================================================================
;; 1. DEFINING A CLASS (defclass)
;; Slots are the fields/properties of the object.
;; =====================================================================
(format t "--- 1. Defining and Instantiating a Class ---~%")

(defclass vehicle ()
  ((brand
    :initarg :brand         ; The key used when creating the object
    :accessor vehicle-brand) ; Automatically builds getter/setter function
   (speed
    :initform 0             ; Default value if not specified
    :accessor vehicle-speed)))

;; Instantiating an object using 'make-instance'
(defparameter *my-car* (make-instance 'vehicle :brand "Toyota"))

;; Accessing properties using the automatically created accessor functions
(format t "Car Brand: ~A~%" (vehicle-brand *my-car*))
(format t "Initial Speed: ~D km/h~%" (vehicle-speed *my-car*))

;; Modifying a property using setf + accessor
(setf (vehicle-speed *my-car*) 60)
(format t "Updated Speed: ~D km/h~%~%" (vehicle-speed *my-car*))


;; =====================================================================
;; 2. GENERIC FUNCTIONS & METHODS (defgeneric / defmethod)
;; In CLOS, methods don't live inside classes. You define a 'generic function'
;; signature, and then write specific methods tailored to target classes.
;; =====================================================================
(format t "--- 2. Generic Functions & Polymorphism ---~%")

;; Define the contract/blueprint of the function
(defgeneric accelerate (obj amount))

;; Implement the method specifically for the 'vehicle' class
(defmethod accelerate ((obj vehicle) amount)
  (incf (vehicle-speed obj) amount)
  (format t "The ~A accelerates to ~D km/h!~%" 
          (vehicle-brand obj) 
          (vehicle-speed obj)))

;; Call the method
(accelerate *my-car* 30)
(format t "~%")


;; =====================================================================
;; 3. INHERITANCE (Subclassing)
;; You pass parent classes inside the initial class list wrapper.
;; =====================================================================
(format t "--- 3. Inheritance and Method Overriding ---~%")

;; 'Electric-Car' inherits all properties (slots) from 'vehicle'
(defclass electric-car (vehicle)
  ((battery-level
    :initform 100
    :accessor battery-level)))

;; Instantiate the subclass
(defparameter *my-ev* (make-instance 'electric-car :brand "Tesla"))

;; It can use the parent's slots and methods out of the box!
(setf (vehicle-speed *my-ev*) 40)
(format t "EV Brand: ~A~%" (vehicle-brand *my-ev*))

;; Overriding or specializing the 'accelerate' method specifically for EVs
(defmethod accelerate ((obj electric-car) amount)
  (incf (vehicle-speed obj) amount)
  (decf (battery-level obj) 5) ; EVs lose battery when accelerating
  (format t "The electric ~A silently glides to ~D km/h. Battery: ~D%~%" 
          (vehicle-brand obj) 
          (vehicle-speed obj)
          (battery-level obj)))

;; This runs the specialized electric-car method, not the base vehicle one
(accelerate *my-ev* 50)
(format t "~%")


;; =====================================================================
;; 4. INSPECTING CLASS TYPES
;; =====================================================================
(format t "--- 4. Checking OOP Types ---~%")

(format t "Type of *my-car*: ~A~%" (type-of *my-car*))
(format t "Type of *my-ev*: ~A~%" (type-of *my-ev*))

;; Checking inheritance/subclass relationships dynamically
(format t "Is *my-ev* a vehicle? ~A~%" (typep *my-ev* 'vehicle))
(format t "Is *my-car* an electric-car? ~A~%~%" (typep *my-car* 'electric-car))