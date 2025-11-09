#  AI Planning with PDDL : Intelligent Agents That Think Before They Act

[![Java](https://img.shields.io/badge/Java-11+-red?logo=java&logoColor=white)](https://www.oracle.com/java/)
[![PDDL](https://img.shields.io/badge/PDDL4J-AI%20Planning%20Library-blue)](http://pddl4j.imag.fr/)
[![Artificial Intelligence](https://img.shields.io/badge/Field-Artificial%20Intelligence-purple)]()
[![Status](https://img.shields.io/badge/Status-Complete-success)]()
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)
[![Made with ❤️ by Meriem](https://img.shields.io/badge/Made%20with%20❤️%20by-Mimi-pink)](https://github.com/myriamlmiii)

---------------------------------------------------------------------

🌍 Problem Statement
In Artificial Intelligence, one of the grand challenges is to make machines plan, reason, and act intelligently in complex environments.
This project addresses that challenge through Automated Planning — teaching a computer to decide what to do next to reach a goal while respecting constraints and dependencies.
It uses PDDL (Planning Domain Definition Language), a standard modeling language for defining actions, goals, and effects in AI planning.
The work demonstrates how reasoning agents can autonomously solve structured problems such as block rearrangement, puzzle solving, robotic container transfer, and Wumpus world navigation.

🎯 Core Goal: Bridge symbolic reasoning and computational efficiency by comparing heuristic search strategies — Enforced Hill Climbing (EHC) and A* — under the Fast-Forward (FF) heuristic.

---------------------------------------------------------------------

🧠 Overview
This repository contains a full exploration of AI Planning using PDDL4J, a Java-based planning engine.
It implements multiple domains, executes different planners, and analyzes their computational performance.

Key Contributions
- Modeled 4 complex planning problems in PDDL.
- Implemented and tested EHC and A* planners.
- Analyzed execution time, memory, and plan efficiency.
- Demonstrated the scalability of symbolic planning for real-world decision problems.

---------------------------------------------------------------------

⚙️ Setup & Usage
Requirements:
- Java 11 or later
- PDDL4J Library: http://pddl4j.imag.fr

# Execute the planner
java -jar pddl4j.jar -o domain.pddl -p problem.pddl -e EHC
java -jar pddl4j.jar -o domain.pddl -p problem.pddl -e ASTAR

---------------------------------------------------------------------

🧩 Project Domains
Domain                 Description                                       Planner(s)       Real-World Analogy
---------------------  ------------------------------------------------  ---------------  ------------------------------------------
🧱 Blocks World        Rearranging blocks into a target configuration    EHC / A*         Industrial assembly sequencing
🧩 4×4 Puzzle          Solving a tile-sliding puzzle                     EHC + FF         Constraint satisfaction / pathfinding
🚢 Robot Docker        Moving containers using a robot and crane         EHC / A*         Logistics and warehouse automation
🕹️ Wumpus World       Collecting gold, avoiding hazards, defeating foe  EHC + FF         Strategic AI / reasoning in unknown worlds

---------------------------------------------------------------------

🧱 Task 1 — Blocks World
Objective:
Rearrange a set of blocks into a specified stack configuration using minimal steps.

Results:
Problem | Planner | Time(s) | Memory(MB) | Observation
pb1     | EHC      | 0.15    | 0.08       | Slightly slower but stable
pb1     | A*       | 0.12    | 0.08       | Slightly faster
pb2     | A*       | 0.13    | 0.13       | Fewer actions
pb3     | EHC      | 0.14    | 0.18       | Better scalability

Insight: For small state spaces both planners perform similarly, but EHC scales better for larger problems due to its local-search behavior.

---------------------------------------------------------------------

🧩 Task 2 — 4×4 Puzzle
Problem:
Model a 4×4 tile puzzle using PDDL predicates and actions.

Structure:
- Predicates: tile, empty, adjacent, move
- Actions: Move tile into empty cell
- Planner: Enforced Hill Climbing (EHC) with FF heuristic

Result:
Efficient solution generation with minimal memory use due to heuristic-guided state pruning.

---------------------------------------------------------------------

🚢 Task 3 — Robot Docker
Objective:
Plan robot and crane operations to move containers between docks.

Domain Components:
- Types: area, container, bot, lifter
- Predicates: at, grasping, stacked-on, free-space, idle
- Actions: grab, release, place-on, transfer

Result:
Generated an optimized plan using coordinated actions between robot and crane — simulating a real logistics workflow.

---------------------------------------------------------------------

🕹️ Task 4 — Wumpus World
Objective:
Guide an agent through the Wumpus cave to collect gold, avoid pits, and defeat the Wumpus.

Domain:
- Types: player, wumpus, gold, location
- Predicates: at, alive-player, alive-wumpus, has-gold, pit-at, safe
- Actions: move, shoot, grab-gold

Example Plan:
move(player pos1 pos2)
shoot(player pos2 pos3)
move(player pos2 pos3)
grab-gold(player gold pos3)

Outcome:
Fast and successful plan computed by EHC+FF showing heuristic efficiency in partially observable settings.

---------------------------------------------------------------------

🧩 Heuristic — Fast-Forward (FF)
The FF heuristic estimates goal distance by ignoring delete effects, enabling planners to:
- Build a Relaxed Planning Graph (RPG)
- Compute approximate cost to reach the goal
- Guide search efficiently without exploring irrelevant states

This heuristic drastically reduces computation time while maintaining near-optimal plan quality.

---------------------------------------------------------------------

🧰 Tools & Technologies
Tool          Purpose
------------- ----------------------------------------------------
Java 11+      PDDL4J execution
PDDL4J        Planning engine for .pddl files
VS Code       Development environment
CLI/Terminal  Execution and debugging
GitHub        Version control and project showcase

---------------------------------------------------------------------

📂 Folder Structure
ai-planning-with-pddl
│
├── project3_report.pdf
├── blocksworld/
│   ├── domain.pddl
│   ├── pb0.pddl
│   ├── pb1.pddl
│   ├── pb2.pddl
│   └── pb3.pddl
│
├── 4x4-puzzle/
│   ├── domain.pddl
│   └── problem.pddl
│
├── dockerrobot/
│   ├── domain.pddl
│   └── problem.pddl
│
├── wampus/
│   ├── domain.pddl
│   └── problem.pddl
│
└── README.md

---------------------------------------------------------------------

👩‍💻 Contributors
Name                     Role
------------------------  -------------------------------------------
Meriem Lmoubariki (Mimi) Project setup, Blocks World, Robot Docker
Mohamed Adam Sterhaltou  Puzzle & Wumpus World
Dr. Tajjeeddine Rachidi  Supervision

---------------------------------------------------------------------

📚 References
- PDDL Reference Guide – Jan Dolejsi (https://github.com/jan-dolejsi/pddl-reference)
- Learn PDDL – Fares Kalaboud (https://fareskalaboud.github.io/LearnPDDL/)
- Intro to PDDL – UofT Course Notes (https://www.cs.toronto.edu/~sheila/2542/w09/A1/introtopddl2.pdf)
- FF Planning System – Hoffmann & Nebel (2001) (https://www.jair.org/index.php/jair/article/view/10302)
- University of Basel – Planning Heuristics (2023) (https://ai.dmi.unibas.ch/_files/teaching/hs23/po/slides/po-d08-handout4.pdf)

---------------------------------------------------------------------

🏁 Conclusion
This project demonstrates how symbolic reasoning and heuristic search can be combined to build intelligent systems capable of autonomous planning and decision-making.
Through PDDL and planner comparison, we show that AI can generalize planning logic across puzzles, robotics, and virtual environments.

"Planning is not just about finding a path — it’s about defining intelligence."

---------------------------------------------------------------------

⭐ If you like this project
Give it a star on GitHub and check out more work by me → https://github.com/myriamlmiii
