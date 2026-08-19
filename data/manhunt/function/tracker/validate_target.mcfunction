# A locked target that is no longer a living runner falls back to auto (FR-3.10).

scoreboard players operation #tgt mh.tmp = @s mh.target
scoreboard players set #found mh.tmp 0
execute as @a[scores={mh.role=1}] if score @s mh.index = #tgt mh.tmp run scoreboard players set #found mh.tmp 1
execute if score #found mh.tmp matches 0 run function manhunt:tracker/auto_target
