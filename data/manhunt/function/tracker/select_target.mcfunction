# tracker/select_target — decide who this hunter is chasing. Runs as the hunter.
#
# mh.target = -1 means auto. A locked target survives until the hunter changes it or
# the runner is eliminated (FR-3.9), so this only ever overwrites -1 or a target that
# has become invalid.

execute if score @s mh.target matches 0.. run function manhunt:tracker/validate_target
execute if score @s mh.target matches ..-1 run function manhunt:tracker/auto_target
