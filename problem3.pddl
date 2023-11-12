(define (problem problem1)
  (:domain restaurant2)
  
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

    (at robot ALA)

    ;; Plate initialization

    (at plate1 PLA)
    (at plate2 ALA)
    (at plate3 AMA)

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
        (at robot PUA)
        (served customer1) (served customer2) (served customer3)
        (at plate1 PMA)    (at plate2 ALA)    (at plate3 PLA)
    )
  )
)