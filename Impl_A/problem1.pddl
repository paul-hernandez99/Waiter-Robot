(define (problem problem1)
  (:domain restaurantA)
  
  ;; Define objects

  (:objects
    robot - robot
    plate1 - plate
    customer1 - customer
    BTA AMA AUA PLA PMA PUA ALA - location
  )
  
  (:init

    ;; Robot initialization

    (at robot AUA)

    ;; Plate initialization

    (at plate1 PLA)

    ;; Customer initialization

    (at customer1 PLA)

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
        (served customer1)
    )
  )
)