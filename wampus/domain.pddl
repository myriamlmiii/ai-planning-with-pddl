(define (domain wumpus)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    player - object
    wumpus - object
    gold - object
    location - object
  )

  (:predicates
    (at ?p - player ?l - location)            ; Player is at a location
    (wumpus-at ?w - wumpus ?l - location)      ; Wumpus is at a location
    (gold-at ?g - gold ?l - location)          ; Gold is at a location
    (alive-player ?p - player)                 ; Player is alive
    (alive-wumpus ?w - wumpus)                 ; Wumpus is alive
    (has-gold ?p - player)                     ; Player has gold
    (safe ?l - location)                       ; A location is safe
    (pit-at ?l - location)                     ; Pit at a location
    (breeze ?l - location)                     ; Breeze near a pit
    (adjacent ?l1 ?l2 - location)              ; Locations are adjacent
  )

  ;; Move action without enforcing "safe" as a strict condition
  (:action move
    :parameters (?p - player ?from - location ?to - location)
    :precondition (and 
      (at ?p ?from)
      (adjacent ?from ?to)
    )
    :effect (and 
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  ;; Action to shoot the Wumpus if adjacent
  (:action shoot
    :parameters (?p - player ?w - wumpus ?l - location)
    :precondition (and 
      (at ?p ?l)
      (wumpus-at ?w ?l)
      (alive-player ?p)
    )
    :effect (and 
      (not (wumpus-at ?w ?l)) 
      (not (alive-wumpus ?w))          ; Wumpus is dead after being shot
    )
  )

  ;; Action to pick up the gold
  (:action pick-up
    :parameters (?p - player ?g - gold ?l - location)
    :precondition (and 
      (at ?p ?l)
      (gold-at ?g ?l)
      (alive-player ?p)
    )
    :effect (and 
      (not (gold-at ?g ?l))
      (has-gold ?p)
    )
  )
)
