(define (problem problem2)
  (:domain restaurant)
  
  ;; Define objects

  (:objects
    robot - robot
    plate1 - plate
    plate2 - plate
    plate3 - plate
    customer1 - customer
    customer2 - customer
    customer3 - customer
    BTA AMA AUA PLA PMA PUA ALA - location
  )
  
  (:init

    ;; Robot initialization

    (at robot BTA)

    ;; Plate initialization

    (at plate1 BTA)
    (at plate2 BTA)
    (at plate3 BTA)

    ;; Customer initialization

    (at customer1 PMA)
    (at customer2 ALA)
    (at customer3 PLA)

    ;; Define adjacent rooms

    (adjacent BTA AUA) (adjacent AUA BTA)
    (adjacent AUA AMA) (adjacent AMA AUA)
    (adjacent AUA PUA) (adjacent PUA AUA)
    (adjacent PUA PMA) (adjacent PMA PUA)
    (adjacent PMA PLA) (adjacent PLA PMA)
    (adjacent AMA ALA) (adjacent ALA AMA)
    (adjacent PLA ALA) (adjacent ALA PLA)

    ;; Specify in which room the buffet is located
    (buffet BTA)
  )
  
  ;; Define the goal state

  (:goal
    (and 
      (at robot BTA)
      (served customer1) (served customer2) (served customer3)
    )
  )
)