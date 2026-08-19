# Everyone without a role becomes a hunter. Does not touch existing assignments.
#
# `unless matches 1..3`, NOT `scores={mh.role=0}`. A player the pack has not seen yet
# has no entry in the objective at all, and a score selector cannot match an absent
# entry — so the button skipped every player who had joined within the last second and
# assigned only those already known. From the operator's side that looks like one
# player getting the role and the rest being ignored, with no error. Verified in-game
# 2026-08-13 by clearing two players' entries and pressing the button.
execute as @a unless score @s mh.role matches 1..3 run function manhunt:roles/api/set_role {role:2}
tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.msg.hunters_set","fallback":"Unassigned players are now hunters.","color":"white"}]
