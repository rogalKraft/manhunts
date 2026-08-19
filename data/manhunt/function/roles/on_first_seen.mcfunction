# roles/on_first_seen — runs once per player, the first time the pack ever sees them.

scoreboard players set @s mh.role 0
scoreboard players set @s mh.deaths 0
scoreboard players set @s mh.dead 0
function manhunt:roles/arm

# autojoin_as (D-8). Only meaningful mid-match; in `idle` an admin assigns roles
# deliberately, so a latecomer is simply unassigned.
execute if data storage manhunt:config {autojoin_as:"hunter"} run function manhunt:roles/api/set_role {role:2}
execute if data storage manhunt:config {autojoin_as:"spectator"} run function manhunt:roles/api/set_role {role:3}

execute if score @s mh.role matches 0 unless data storage manhunt:state {phase:"idle"} run tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.join.in_progress","fallback":"A match is in progress. Ask an operator for a role.","color":"gray"}]
