(define (domain domain)
    (:requirements :adl )
    
    (:types
        location
        customer - object
        plate - object
    )
    
    (:predicates
        (adjacent ?x - location ?y - location)
        (at-robot ?x - location)
        (at ?x - object ?y - location)

        (holding ?p - plate)
        (has-food ?p - plate)
        (served ?c - customer)

        (empty-handed-robot)
        (is-bta ?x - location)
    )
    
    (:action pickup
        :parameters (?p - plate ?x - location)
        :precondition (and 
            (at-robot ?x)
            (at ?p ?x)
            (empty-handed-robot)
        )
        :effect (and
            (holding ?p)
            (not (empty-handed-robot))
        )
    )
    
    (:action present
        :parameters (?p - plate ?c - customer ?x - location)
        :precondition (and
            (at-robot ?x)
            (at ?c ?x)
            (holding ?p)
            (has-food ?p)
        )
        :effect (and
            (empty-handed-robot)
            (served ?c)
            (not (holding ?p))
        )
    )
    
    (:action fill
        :parameters (?p - plate ?x - location)
        :precondition (and
            (at ?p ?x)
			(is-bta ?x)
            (not (has-food ?p))
            (holding ?p)
        )
        :effect (and
            (has-food ?p)
        )
    )
    
    (:action move
        :parameters (?x - location ?y - location)
        :precondition (and
            (at-robot ?x)
            (adjacent ?x ?y)
        )
        :effect (and
            (at-robot ?y)
            (not (at-robot ?x))
            (forall (?p - plate) 
                (when (holding ?p)
                    (and (at ?p ?y) (not (at ?p ?x)))
                )
            )
        )
    )
)