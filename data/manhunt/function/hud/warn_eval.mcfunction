# hud/warn_eval — which band is the nearest hunter in, and is it time to pulse?
#
# Macro. Required keys: d, q   (from manhunt:tmp warn — the radius and a quarter of it)
# Call sites: hud/warn_one
#
# Two bands, not a smooth curve: slow at the edge, fast inside a quarter of the radius.
# Two is enough to convey the direction of travel — closing or opening — and keeps the
# cadence readable instead of jittering with every step the hunter takes.
#
# The beat comes from gametime, not a per-player timer: every runner pulses on the same
# tick, which is fine because the signal is about the hunter's distance, not about the
# runner. It also means the cadence survives /reload with nothing to restore.

scoreboard players set #warn.band mh.tmp 0
$execute if entity @a[scores={mh.role=2},distance=..$(d)] run scoreboard players set #warn.band mh.tmp 1
$execute if entity @a[scores={mh.role=2},distance=..$(q)] run scoreboard players set #warn.band mh.tmp 2

execute if score #warn.band mh.tmp matches 0 run return 0

execute store result score #g60 mh.tmp run time query gametime
scoreboard players operation #g20 mh.tmp = #g60 mh.tmp
scoreboard players set #m60 mh.tmp 60
scoreboard players set #m20 mh.tmp 20
scoreboard players operation #g60 mh.tmp %= #m60 mh.tmp
scoreboard players operation #g20 mh.tmp %= #m20 mh.tmp

# This function is reached every 10 ticks, so "< 10" fires exactly once per period.
execute if score #warn.band mh.tmp matches 1 if score #g60 mh.tmp matches ..9 run function manhunt:hud/warn_fire
execute if score #warn.band mh.tmp matches 2 if score #g20 mh.tmp matches ..9 run function manhunt:hud/warn_fire
