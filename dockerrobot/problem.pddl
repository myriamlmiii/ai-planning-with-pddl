(define (problem warehouse-robot-problem)
  (:domain warehouse-robot)

  (:objects
    area1 area2 - area
    lifter1 lifter2 - lifter
    robot1 - bot
    box1 box2 - container
    storage1 storage2 - area
  )

  (:init
    (located lifter1 storage1)
    (located lifter2 storage2)
    (located robot1 area1)
    (located box1 storage1)
    (located box2 storage1)
    (free-space box1)
    (free-space box2)
    (handfree robot1)
    (idle lifter1)
    (idle lifter2)
  )

  (:goal
    (and
      (located box1 storage2)
      (stacked-on box2 box1)
      (located robot1 storage2)
      (free-space box2)
    )
  )
)
