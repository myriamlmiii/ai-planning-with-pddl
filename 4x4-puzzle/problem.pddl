(define (problem sliding-puzzle-setup)
  (:domain sliding-puzzle)

  ;; Define pieces and positions
  (:objects
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 es - piece
  )

  ;; Initial state configuration
  (:init 
    (next-to p1 p2)
    (next-to p2 p3)
    (next-to p3 p4)
    (next-to p5 p6)
    (next-to p6 p7)
    (next-to p7 p8)
    (next-to p9 p10)
    (next-to p10 p11)
    (next-to p11 p12)
    (next-to p13 p14)
    (next-to p14 p15)
    (empty-space es) ; Assume 'es' is the empty space tile at the last position
  )

  ;; Goal configuration
  (:goal 
    (and 
      (next-to p1 p2)
      (next-to p2 p3)
      (next-to p3 p4)
      (next-to p5 p6)
      (next-to p6 p7)
      (next-to p7 p8)
      (next-to p9 p10)
      (next-to p10 p11)
      (next-to p11 p12)
      (next-to p13 p14)
      (next-to p14 p15)
      (empty-space es)
    )
  )
)
