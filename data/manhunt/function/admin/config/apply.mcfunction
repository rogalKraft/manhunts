# admin/config/apply — write back everything the settings screen returned.
#
# Macro. Required keys: lobby, pen, head, rl, hl, wd, grace, expand, to,
#                       end, nether, warn, resp, loc, adv, inv
# Call sites: the Apply button in admin/config/show
#
# NOTHING is written straight from a substitution. Both halves land in scratch storage
# first and are then re-typed, because what a dialog hands back does not match what
# this pack stores.
#
# Booleans are the dangerous one, and it was caught only by reading the config back
# after a save. The dialog returns 1/0, so `set value $(end)` stored the INTEGER 1 —
# which looks right in a dump and is invisible to `{track_end:true}`, since NBT
# matching is type-sensitive and a boolean is a byte. Pressing Apply therefore turned
# OFF every boolean feature at once — End and Nether tracking, the runner warning, the
# locator-bar suppression, instant respawn, and both lobby protections — while
# reporting that the settings had been saved.
#
# Numbers get the same treatment: a slider can hand back a real, and storing 20.000002
# where the pack expects 20 breaks every `matches` that reads it.

$data modify storage manhunt:tmp in.lobby set value $(lobby)
$data modify storage manhunt:tmp in.pen set value $(pen)
$data modify storage manhunt:tmp in.head set value $(head)
$data modify storage manhunt:tmp in.rl set value $(rl)
$data modify storage manhunt:tmp in.hl set value $(hl)
$data modify storage manhunt:tmp in.wd set value $(wd)
$data modify storage manhunt:tmp in.grace set value $(grace)
$data modify storage manhunt:tmp in.expand set value $(expand)
$data modify storage manhunt:tmp in.to set value $(to)
$data modify storage manhunt:tmp in.end set value $(end)
$data modify storage manhunt:tmp in.nether set value $(nether)
$data modify storage manhunt:tmp in.warn set value $(warn)
$data modify storage manhunt:tmp in.resp set value $(resp)
$data modify storage manhunt:tmp in.loc set value $(loc)
$data modify storage manhunt:tmp in.adv set value $(adv)
$data modify storage manhunt:tmp in.inv set value $(inv)

# Re-type: integers for the numbers.
execute store result score #c mh.tmp run data get storage manhunt:tmp in.lobby
execute store result storage manhunt:config lobby_seconds int 1 run scoreboard players get #c mh.tmp
execute store result score #c mh.tmp run data get storage manhunt:tmp in.pen
execute store result storage manhunt:config lobby_border_size int 1 run scoreboard players get #c mh.tmp
execute store result score #c mh.tmp run data get storage manhunt:tmp in.head
execute store result storage manhunt:config headstart_seconds int 1 run scoreboard players get #c mh.tmp
execute store result score #c mh.tmp run data get storage manhunt:tmp in.rl
execute store result storage manhunt:config runner_lives int 1 run scoreboard players get #c mh.tmp
execute store result score #c mh.tmp run data get storage manhunt:tmp in.hl
execute store result storage manhunt:config hunter_lives int 1 run scoreboard players get #c mh.tmp
execute store result score #c mh.tmp run data get storage manhunt:tmp in.wd
execute store result storage manhunt:config runner_warning_distance int 1 run scoreboard players get #c mh.tmp
execute store result score #c mh.tmp run data get storage manhunt:tmp in.grace
execute store result storage manhunt:config disconnect_grace_seconds int 1 run scoreboard players get #c mh.tmp
execute store result score #c mh.tmp run data get storage manhunt:tmp in.expand
execute store result storage manhunt:config border_expand_seconds int 1 run scoreboard players get #c mh.tmp
execute store result score #c mh.tmp run data get storage manhunt:tmp in.to
execute store result storage manhunt:config border_expand_to int 1 run scoreboard players get #c mh.tmp

# Re-type: real booleans. Reading through a score accepts either 1/0 or true/false,
# so this stays correct whichever form the dialog hands back.
execute store result score #c mh.tmp run data get storage manhunt:tmp in.end
execute if score #c mh.tmp matches 1.. run data modify storage manhunt:config track_end set value true
execute if score #c mh.tmp matches ..0 run data modify storage manhunt:config track_end set value false
execute store result score #c mh.tmp run data get storage manhunt:tmp in.nether
execute if score #c mh.tmp matches 1.. run data modify storage manhunt:config track_nether set value true
execute if score #c mh.tmp matches ..0 run data modify storage manhunt:config track_nether set value false
execute store result score #c mh.tmp run data get storage manhunt:tmp in.warn
execute if score #c mh.tmp matches 1.. run data modify storage manhunt:config runner_warning set value true
execute if score #c mh.tmp matches ..0 run data modify storage manhunt:config runner_warning set value false
execute store result score #c mh.tmp run data get storage manhunt:tmp in.resp
execute if score #c mh.tmp matches 1.. run data modify storage manhunt:config force_immediate_respawn set value true
execute if score #c mh.tmp matches ..0 run data modify storage manhunt:config force_immediate_respawn set value false
execute store result score #c mh.tmp run data get storage manhunt:tmp in.loc
execute if score #c mh.tmp matches 1.. run data modify storage manhunt:config hide_locator_bar set value true
execute if score #c mh.tmp matches ..0 run data modify storage manhunt:config hide_locator_bar set value false
execute store result score #c mh.tmp run data get storage manhunt:tmp in.adv
execute if score #c mh.tmp matches 1.. run data modify storage manhunt:config lobby_adventure set value true
execute if score #c mh.tmp matches ..0 run data modify storage manhunt:config lobby_adventure set value false
execute store result score #c mh.tmp run data get storage manhunt:tmp in.inv
execute if score #c mh.tmp matches 1.. run data modify storage manhunt:config lobby_invulnerable set value true
execute if score #c mh.tmp matches ..0 run data modify storage manhunt:config lobby_invulnerable set value false

data remove storage manhunt:tmp in

tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.cfg.saved","fallback":"Settings saved.","color":"white"}]
function manhunt:admin/config/menu
