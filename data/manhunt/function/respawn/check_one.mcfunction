# respawn/check_one — one role-holder, every tick.
#
# BOTH detectors are needed. Each alone has a hole, and both holes were hit in play:
#
#   Health == 0   true the instant they die, and works even if they never respawn —
#                 but with immediate_respawn the death and respawn can complete inside
#                 a single tick, so no tick observes zero health. A kill that ended the
#                 match on one attempt was silently missed on the next.
#
#   deathCount    syncs from the statistic when the player RESPAWNS, catching exactly
#                 the case health misses — and missing the case health catches, since a
#                 player on the death screen never increments it.
#
# mh.dead is a REFRACTORY COUNTDOWN, not a boolean, and that distinction is the whole
# fix. A plain flag re-armed as soon as the player was alive with no pending count —
# but on_death zeroes the count immediately, so the flag cleared one tick later, and
# only THEN did the respawn's statistic delta arrive, hit an armed flag, and fire the
# same death a second time. In testing that second fire landed after the head start
# had ended, so a death that should have cost nothing eliminated the runner one tick
# into the match.
#
# Counting down 40 ticks of being alive swallows any late signal from the same death,
# and spans a phase change so a lobby or head-start death cannot leak into the match.

execute if score @s mh.dead matches ..0 if data entity @s {Health:0.0f} run function manhunt:respawn/on_death
execute if score @s mh.dead matches ..0 if score @s mh.deaths matches 1.. run function manhunt:respawn/on_death

execute if score @s mh.dead matches 1.. run scoreboard players set @s mh.deaths 0
execute if score @s mh.dead matches 1.. unless data entity @s {Health:0.0f} run scoreboard players remove @s mh.dead 1
