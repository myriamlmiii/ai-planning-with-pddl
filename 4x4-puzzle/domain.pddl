(define (domain sliding-puzzle)
  (:requirements :strips :typing)
  (:types piece)

  ;; Predicates to represent the puzzle's current state
  (:predicates
    (next-to ?p1 - piece ?p2 - piece)  ; Predicate indicating ?p1 is adjacent to ?p2
    (empty-space ?e - piece)           ; Predicate indicating a tile is an empty space
  )

  ;; Action to shift a piece into the empty space
  (:action shift
    :parameters (?p - piece ?adj - piece ?e - piece) ; ?p is the tile to move, ?adj is the adjacent tile, and ?e is the empty space
    :precondition (and 
      (next-to ?p ?adj)            ; ?p is adjacent to ?adj
      (empty-space ?e)             ; There is an empty space tile
    )
    :effect (and 
      (not (next-to ?p ?adj))      ; ?p is no longer next to ?adj
      (next-to ?p ?e)              ; ?p is now next to the empty space
      (not (empty-space ?e))       ; The old empty space is no longer empty
      (empty-space ?adj)           ; The new position becomes the empty space
    )
  )
)
