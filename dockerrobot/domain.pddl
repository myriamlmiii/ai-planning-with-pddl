(define (domain warehouse-robot)
  (:requirements :strips :typing)

  (:types
    area item container lifter bot
  )

  (:predicates
    (located ?obj - object ?loc - area)                 ; Specifies the location of an object
    (stacked-on ?item1 - container ?item2 - container)  ; Specifies stacking order between containers
    (grasping ?lifter - lifter ?container - container)  ; Lifter is grasping a container
    (free-space ?container - container)                 ; Container has free space on top
    (idle ?lifter - lifter)                             ; Lifter is idle and ready to grasp
    (handfree ?bot - bot)                               ; Robot’s hand is free
  )

  (:action grab
    :parameters (?lifter - lifter ?container - container ?loc - area)
    :precondition (and 
      (located ?lifter ?loc)
      (located ?container ?loc)
      (free-space ?container)
      (idle ?lifter)
    )
    :effect (and
      (grasping ?lifter ?container)
      (not (idle ?lifter))
      (not (located ?container ?loc))
    )
  )

  (:action release
    :parameters (?lifter - lifter ?container - container ?loc - area)
    :precondition (and
      (grasping ?lifter ?container)
      (located ?lifter ?loc)
    )
    :effect (and
      (located ?container ?loc)
      (idle ?lifter)
      (not (grasping ?lifter ?container))
    )
  )

  (:action place-on
    :parameters (?container1 - container ?container2 - container ?lifter - lifter)
    :precondition (and 
      (grasping ?lifter ?container1)
      (free-space ?container2)
    )
    :effect (and
      (stacked-on ?container1 ?container2)
      (free-space ?container1)
      (not (grasping ?lifter ?container1))
      (idle ?lifter)
      (not (free-space ?container2))
    )
  )

  (:action lift-off
    :parameters (?container1 - container ?container2 - container ?lifter - lifter)
    :precondition (and 
      (stacked-on ?container1 ?container2)
      (free-space ?container1)
      (idle ?lifter)
    )
    :effect (and
      (grasping ?lifter ?container1)
      (free-space ?container2)
      (not (idle ?lifter))
      (not (stacked-on ?container1 ?container2))
    )
  )

  (:action transfer
    :parameters (?bot - bot ?origin - area ?destination - area)
    :precondition (located ?bot ?origin)
    :effect (and
      (located ?bot ?destination)
      (not (located ?bot ?origin))
    )
  )
)
