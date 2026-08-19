# win/check — evaluated every tick in `running`, in STRICT priority order.
#
# The order IS the tie-break. Dragon first means a runner who dies on the same tick
# the dragon dies still wins (D-5), and because it is an ordering inside one function
# rather than a race between two detectors, it is deterministic by construction —
# there is no intra-tick luck to depend on.
#
# `return run` after each: the first condition that matches ends the match and nothing
# below it is evaluated.

execute if entity @a[scores={mh.dragon=1..}] run return run function manhunt:win/api/declare {winner:"runners",reason:"dragon_slain"}

execute if score #runners.alive mh.tmp matches ..0 run return run function manhunt:win/api/declare {winner:"hunters",reason:"runners_eliminated"}

# Only meaningful with finite hunter lives; with hunter_lives = 0 nobody is ever
# eliminated and the counter never falls.
execute unless data storage manhunt:config {hunter_lives:0} if score #hunters.alive mh.tmp matches ..0 run return run function manhunt:win/api/declare {winner:"runners",reason:"hunters_eliminated"}
