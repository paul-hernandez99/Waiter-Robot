(define (domain restaurantA)
    (:requirements :adl )
    
    (:types
        robot - object
        location
        customer - object
        plate - object
    )
    
    (:predicates
        (at ?obj - object ?loc2 - location)
        (adjacent ?loc1 - location ?loc2 - location)
        (hasFood ?p - plate)
        (hasPlate ?r - robot)
        (holding ?r -robot ?p - plate)
        (served ?c - customer)
        (buffet ?loc - location)
		(isServed ?p - plate)
    )
    
    (:action pick-up
        :parameters (?r - robot ?p - plate ?loc - location)
        :precondition (and 
            (at ?r ?loc)
            (at ?p ?loc)
            (not (hasPlate ?r))
			(not (isServed ?p))
        )
        :effect (and
            (holding ?r ?p)
            (hasPlate ?r)
        )
    )
    
    (:action present
        :parameters (?r - robot ?p - plate ?c - customer ?loc - location)
        :precondition (and
            (at ?r ?loc)
            (at ?c ?loc)
            (holding ?r ?p)
            (hasFood ?p)
            (not (served ?c))
        )
        :effect (and
            (served ?c)
            (not (holding ?r ?p))
            (not (hasPlate ?r)) 
			(isServed ?p)
        )
    )
    
    (:action fill
        :parameters (?r - robot ?p - plate ?loc - location)
        :precondition (and
            (at ?r ?loc)
			(buffet ?loc)
            (holding ?r ?p)
            (not (hasFood ?p))
        )
        :effect (and
            (hasFood ?p)
        )
    )
    
    (:action move
        :parameters (?r - robot ?loc1 - location ?loc2 - location)
        :precondition (and
            (at ?r ?loc1)
            (adjacent ?loc1 ?loc2)
        )
        :effect (and
            (at ?r ?loc2)
            (not (at ?r ?loc1))
            (forall (?p - plate) 
                (when (holding ?r ?p)
                    (and (at ?p ?loc2)
                    (not (at ?p ?loc1)))
                )
            )
        )
    )
)