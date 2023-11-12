(define (domain restaurant)
  (:requirements :strips :adl :typing :fluents)

  (:types
    robot customer plate location - object
  )

  (:predicates
    (at ?obj - object ?loc - location)
    (adjacent ?loc1 - location ?loc2 - location)
    (hasFood ?p - plate)
    (hasPlate ?r - robot)
    (holding ?r - robot ?p - plate)
    (served ?c - customer)
    (buffet ?loc - location)
  )

  (:action pick-up
    :parameters (?r - robot ?p - plate ?loc - location)
    :precondition (and
		(at ?r ?loc)
		(at ?p ?loc)
		(not (hasPlate ?r)))
    :effect (and
		(holding ?r ?p)
		(hasPlate ?r))
  )

  (:action present
    :parameters (?r - robot ?p - plate ?loc - location ?c - customer)
    :precondition (and
		(at ?c ?loc)
		(at ?r ?loc)
		(holding ?r ?p)
		(hasFood ?p)
		(not (served ?c)))
    :effect (and
		(served ?c)
		(not (holding ?r ?p))
		(not (hasPlate ?r)))
  )

  (:action fill
    :parameters (?r - robot ?p - plate ?loc - location)
    :precondition (and
		(at ?r ?loc)
		(buffet ?loc)
		(holding ?r ?p)
		(not (hasFood ?p)))
    :effect (and
		(hasFood ?p))
  )

  (:action move
    :parameters (?r - robot ?loc1 - location ?loc2 - location)
    :precondition (and
		(at ?r ?loc1)
		(adjacent ?loc1 ?loc2)
		(not (hasPlate ?r)))
    :effect (and
		(at ?r ?loc2)
		(not (at ?r ?loc1)))
  )

  (:action move_plate
    :parameters (?r - robot ?p - plate ?loc1 - location ?loc2 - location)
    :precondition (and
		(at ?r ?loc1)
		(adjacent ?loc1 ?loc2)
		(holding ?r ?p))
    :effect (and
		(at ?r ?loc2)
		(not (at ?r ?loc1))
		(at ?p ?loc2)
		(not (at ?p ?loc1)))
  )
)