# lifecycle/to_running — the head start is over. Tracking goes live.

function manhunt:lifecycle/api/set_phase {phase:"running"}
execute store result storage manhunt:state match_started long 1 run time query gametime
data modify storage manhunt:state prep_remaining set value 0

# TODO(step 8): remove the manhunt:prep_freeze attribute modifier from every hunter.
#   A leak here leaves a permanently immobile player (R-4), so removal must also
#   happen on death, disconnect, role change, match end and every reset tier.

# Wipe every pending signal at the boundary.
#
# A death in the lobby or head start costs nothing, but its deathCount statistic
# arrives whenever the player gets round to respawning — which can be long after the
# refractory window has closed. Observed in play: a runner killed 22 seconds into the
# head start still had an unconsumed signal when the match began, and it eliminated
# them one tick into RUNNING with a match duration of 1.
#
# Timing-based guards cannot fix that, because the delay is the player's to choose.
# Clearing at the boundary can: nothing that happened before the match starts is
# allowed to be read after it.
scoreboard players set @a[scores={mh.role=1..2}] mh.deaths 0
scoreboard players set @a[scores={mh.role=1..2}] mh.dead 0

# The dragon counter belongs to the same class and was missed at first. A kill scored
# before the match begins would otherwise be read on the first tick of RUNNING and end
# it immediately — reproduced in testing, with a recorded match duration of 0.
scoreboard players reset @a mh.dragon

function manhunt:hud/go
