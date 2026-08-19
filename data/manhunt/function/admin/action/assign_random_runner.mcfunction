# Pick one hunter at random and make them the runner.
#
# @r is deliberate here and is the one place it is allowed: randomness is forbidden in
# decisions that affect the match RESULT, not in pre-match setup where the whole point
# is that nobody chose.
execute as @r[scores={mh.role=2}] run function manhunt:roles/api/set_role {role:1}
tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.msg.runner_set","fallback":"A random hunter is now the runner.","color":"white"}]
