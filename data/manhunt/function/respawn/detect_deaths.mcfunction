# respawn/detect_deaths — find players who have just died. Runs EVERY TICK.
#
# Neither obvious detector works alone, and both failures were seen in-game:
#
#   deathCount  syncs from the statistic only once the player RESPAWNS, so a player
#               left sitting on the death screen is never counted. A one-life runner
#               refusing to click would stall the match outcome indefinitely.
#
#   Health == 0 is true the instant they die, but only for a handful of ticks — and
#               with immediate_respawn on, for barely one. Sampling once a second
#               missed it entirely.
#
# So: health, sampled every tick. mh.dead turns the level into an edge — fire once on
# the way down, re-arm on the way back up — which makes the check idempotent and
# independent of when, or whether, the player respawns.
#
# Cost is one function call per role-holder per tick, each doing two cheap NBT reads
# on a player that is loaded by definition. Nothing here touches an entity selector.

execute as @a[scores={mh.role=1..2}] run function manhunt:respawn/check_one
