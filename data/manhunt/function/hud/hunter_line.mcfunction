# Runs as, and at, one hunter.
#
# Distance is BUCKETED, not exact. Scoreboards have no square root, and an exact
# readout would also hand the hunter more than the mode wants them to have — half of
# Manhunt is acting on uncertainty. Buckets come from the SQUARED horizontal distance,
# which needs no sqrt at all: the thresholds are just the squares of 50, 100, 250, 500
# and 1000.
#
# Both deltas are clamped before squaring: at 30 000 000 blocks dx*dx overflows a
# 32-bit score and the comparison silently inverts.

execute if score @s mh.st matches ..0 run return run title @s actionbar [{"translate":"manhunt.hud.no_signal","fallback":"Tracker: no signal","color":"dark_gray","italic":true}]

execute store result storage manhunt:tmp hline.tgt int 1 run scoreboard players get @s mh.target

execute if score @s mh.st matches 2 run data modify storage manhunt:tmp hline.col set value "gold"
execute if score @s mh.st matches 2 run data modify storage manhunt:tmp hline.txt set value "manhunt.hud.last_seen"
execute if score @s mh.st matches 2 run data modify storage manhunt:tmp hline.fb set value "last seen here"
execute if score @s mh.st matches 2 run return run function manhunt:hud/hunter_emit with storage manhunt:tmp hline

execute store result score #hx mh.tmp run data get entity @s Pos[0]
execute store result score #hz mh.tmp run data get entity @s Pos[2]
scoreboard players operation #dx mh.tmp = #hx mh.tmp
scoreboard players operation #dx mh.tmp -= @s mh.px
scoreboard players operation #dz mh.tmp = #hz mh.tmp
scoreboard players operation #dz mh.tmp -= @s mh.pz

scoreboard players set #cmax mh.tmp 30000
scoreboard players set #cmin mh.tmp -30000
scoreboard players operation #dx mh.tmp < #cmax mh.tmp
scoreboard players operation #dx mh.tmp > #cmin mh.tmp
scoreboard players operation #dz mh.tmp < #cmax mh.tmp
scoreboard players operation #dz mh.tmp > #cmin mh.tmp

scoreboard players operation #dx mh.tmp *= #dx mh.tmp
scoreboard players operation #dz mh.tmp *= #dz mh.tmp
scoreboard players operation #dx mh.tmp += #dz mh.tmp

data modify storage manhunt:tmp hline.col set value "red"
data modify storage manhunt:tmp hline.txt set value "manhunt.hud.far"
data modify storage manhunt:tmp hline.fb set value "far away"
execute if score #dx mh.tmp matches ..1000000 run data modify storage manhunt:tmp hline.txt set value "manhunt.hud.u1000"
execute if score #dx mh.tmp matches ..1000000 run data modify storage manhunt:tmp hline.fb set value "under 1000m"
execute if score #dx mh.tmp matches ..1000000 run data modify storage manhunt:tmp hline.col set value "gold"
execute if score #dx mh.tmp matches ..250000 run data modify storage manhunt:tmp hline.txt set value "manhunt.hud.u500"
execute if score #dx mh.tmp matches ..250000 run data modify storage manhunt:tmp hline.fb set value "under 500m"
execute if score #dx mh.tmp matches ..250000 run data modify storage manhunt:tmp hline.col set value "yellow"
execute if score #dx mh.tmp matches ..62500 run data modify storage manhunt:tmp hline.txt set value "manhunt.hud.u250"
execute if score #dx mh.tmp matches ..62500 run data modify storage manhunt:tmp hline.fb set value "under 250m"
execute if score #dx mh.tmp matches ..10000 run data modify storage manhunt:tmp hline.txt set value "manhunt.hud.u100"
execute if score #dx mh.tmp matches ..10000 run data modify storage manhunt:tmp hline.fb set value "under 100m"
execute if score #dx mh.tmp matches ..10000 run data modify storage manhunt:tmp hline.col set value "green"
execute if score #dx mh.tmp matches ..2500 run data modify storage manhunt:tmp hline.txt set value "manhunt.hud.very_close"
execute if score #dx mh.tmp matches ..2500 run data modify storage manhunt:tmp hline.fb set value "VERY CLOSE"

function manhunt:hud/hunter_emit with storage manhunt:tmp hline
