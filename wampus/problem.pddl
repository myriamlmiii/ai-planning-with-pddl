(define (problem wumpus-problem)
  (:domain wumpus)

  (:objects
    p1 p2 p3 p4 p5 - location
    g1 - gold
    w - wumpus
    r1 - player
  )

  (:init
    (at r1 p1)                    ; Player starts at location p1
    (wumpus-at w p3)              ; Wumpus is at location p3
    (gold-at g1 p4)               ; Gold is at location p4
    (alive-player r1)             ; Player is alive
    (alive-wumpus w)              ; Wumpus is alive

    ;; Safe locations and hazards
    (safe p1)
    (safe p2)
    (safe p3)
    (pit-at p5)                   ; Pit at location p5
    (breeze p4)                   ; Breeze at location p4, near pit

    ;; Adjacency relationships
    (adjacent p1 p2)
    (adjacent p2 p3)
    (adjacent p3 p4)
    (adjacent p4 p5)
  )

  (:goal
    (and
      (has-gold r1)               ; Player has picked up gold
      (not (alive-wumpus w))      ; Wumpus is dead
    )
  )
)
