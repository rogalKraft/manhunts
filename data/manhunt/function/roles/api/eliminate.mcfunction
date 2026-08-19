# roles/api/eliminate — @s is out. Runs as the eliminated player.
#
# Spectator is a real role, not a hidden state: excluded from tracking targets and from
# every win condition (FR-2.8). Because auto-targeting selects on mh.role=1, an
# eliminated runner drops out of every hunter's target pool automatically.
#
# The counter is decremented BEFORE the role changes — afterwards @s is a spectator and
# the pack can no longer tell which side just lost someone.

execute if score @s mh.role matches 1 run scoreboard players remove #runners.alive mh.tmp 1
execute if score @s mh.role matches 2 run scoreboard players remove #hunters.alive mh.tmp 1

# The remaining count is announced HERE, on the event, rather than pinned to a HUD:
# with infinite hunter lives — the default — a permanent readout never changes and says
# nothing after the first second. Reporting it when it moves is the only time the
# number carries information.
execute if score @s mh.role matches 1 run tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"selector":"@s","color":"green"},{"translate":"manhunt.elim.left","fallback":" is eliminated — ","color":"white"},{"score":{"name":"#runners.alive","objective":"mh.tmp"},"color":"yellow"},{"text":" ","color":"gray"},{"translate":"manhunt.team.runners","fallback":"Runners","color":"gray"}]
execute if score @s mh.role matches 2 run tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"selector":"@s","color":"red"},{"translate":"manhunt.elim.left","fallback":" is eliminated — ","color":"white"},{"score":{"name":"#hunters.alive","objective":"mh.tmp"},"color":"yellow"},{"text":" ","color":"gray"},{"translate":"manhunt.team.hunters","fallback":"Hunters","color":"gray"}]

function manhunt:roles/api/set_role {role:3}
gamemode spectator @s

clear @s minecraft:compass[minecraft:custom_data~{mh:1b}]

# win/check runs on the next tick and sees the updated counter, so there is no need to
# re-evaluate here — doing so would risk declaring an outcome from inside a role change,
# which is exactly the kind of re-entrancy that produces two winners.
