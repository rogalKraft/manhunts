# roles/project_teams — re-derive every team from mh.role.
#
# Runs once per second, not because roles change that often, but because anything
# else may move players between teams: an admin typing /team, another data pack, a
# crash mid-assignment. Re-projecting makes all of that self-correcting rather than a
# silent corruption of who is being hunted.

team join mh.runners @a[scores={mh.role=1}]
team join mh.hunters @a[scores={mh.role=2}]
team join mh.spectators @a[scores={mh.role=3}]
# `unless matches 1..3` rather than `scores={mh.role=0}`: a player the pack has never
# seen has NO entry in the objective, and a score selector cannot match an absent
# entry. The negative form catches both "unassigned" and "not yet known".
execute as @a unless score @s mh.role matches 1..3 run team leave @s
