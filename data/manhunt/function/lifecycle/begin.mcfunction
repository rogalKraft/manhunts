# lifecycle/begin — preconditions passed. Set the match up and enter PREP.
#
# `data get <path> 20` returns the value already multiplied by the scale, so this is
# seconds -> ticks in one command with no arithmetic.

execute store result score #prep mh.tmp run data get storage manhunt:config headstart_seconds 20
execute store result storage manhunt:state prep_remaining int 1 run scoreboard players get #prep mh.tmp

data modify storage manhunt:state outcome.winner set value "none"
data modify storage manhunt:state outcome.reason set value ""
data modify storage manhunt:state outcome.duration set value 0L

# A kill scored in a previous match must not win this one.
scoreboard players reset @a mh.dragon
scoreboard players reset @a mh.deaths

function manhunt:lifecycle/gamerule/take_respawn

function manhunt:roles/api/init_lives

execute if data storage manhunt:config {hide_locator_bar:true} as @a[scores={mh.role=1..2}] run function manhunt:roles/waypoint_off

function manhunt:tracker/api/build
# TODO(step 8): freeze hunters        -- D-12, attribute modifier manhunt:prep_freeze

function manhunt:hud/match_start

# Route: lobby -> prep -> running. Either of the first two is skipped entirely when
# its duration is 0 (FR-1.7), so a host who wants the old behaviour sets lobby_seconds
# to 0 and nothing about the match changes.
execute store result score #lobby mh.tmp run data get storage manhunt:config lobby_seconds 20
execute store result storage manhunt:state lobby_remaining int 1 run scoreboard players get #lobby mh.tmp

execute if score #lobby mh.tmp matches 1.. run return run function manhunt:lifecycle/to_lobby
execute if score #prep mh.tmp matches 1.. run function manhunt:lifecycle/to_prep
execute if score #prep mh.tmp matches ..0 run function manhunt:lifecycle/to_running
