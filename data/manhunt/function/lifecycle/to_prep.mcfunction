# lifecycle/to_prep — enter the head start.
#
# Paints the bossbar once here as well as on the modulo tick in prep_tick. Without
# this the bar keeps the PREVIOUS match's text for up to a second after start, since
# prep_tick only repaints when prep_remaining is a multiple of 20. Caught in-game
# 2026-08-11: the bar read "Manhunt — in progress" during the first second of PREP.

function manhunt:lifecycle/api/set_phase {phase:"prep"}

scoreboard players set #c20 mh.tmp 20
scoreboard players operation #prep.s mh.tmp = #prep mh.tmp
scoreboard players operation #prep.s mh.tmp /= #c20 mh.tmp

# Open the pen and hand the world back to the players: survival, no resistance, the
# border growing to full size over border_expand_seconds. From here the runner's head
# start actually means something, because they can leave.
function manhunt:lifecycle/border/expand
function manhunt:lifecycle/lobby_release

function manhunt:hud/bossbar_prep
