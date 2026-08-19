# roles/apply — bring @s's presentation in line with their mh.role.
#
# Called right after any role change so the player sees the result immediately, rather
# than waiting up to a second for the next projection cycle.

function manhunt:roles/project_self
function manhunt:roles/arm

# Off the locator bar while holding a role, back on it otherwise (see waypoint_off).
execute if data storage manhunt:config {hide_locator_bar:true} if score @s mh.role matches 1..2 run function manhunt:roles/waypoint_off
execute if score @s mh.role matches ..0 run function manhunt:roles/waypoint_on

execute if score @s mh.role matches 0 run tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.role.none","fallback":"You have no role.","color":"gray"}]
execute if score @s mh.role matches 1 run title @s title [{"translate":"manhunt.role.runner","fallback":"RUNNER","color":"green","bold":true}]
execute if score @s mh.role matches 1 run title @s subtitle [{"translate":"manhunt.role.runner.sub","fallback":"Kill the Ender Dragon","color":"gray"}]
execute if score @s mh.role matches 2 run title @s title [{"translate":"manhunt.role.hunter","fallback":"HUNTER","color":"red","bold":true}]
execute if score @s mh.role matches 2 run title @s subtitle [{"translate":"manhunt.role.hunter.sub","fallback":"Kill the runners","color":"gray"}]
execute if score @s mh.role matches 3 run title @s title [{"translate":"manhunt.role.spectator","fallback":"SPECTATOR","color":"gray","bold":true}]
