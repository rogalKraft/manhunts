# tracker/api/set_target — a hunter picked from the menu. Runs as that hunter.
#
# Read BEFORE core/trigger/pick consumes the score. 999 is the sentinel for auto;
# anything else is index+1, undone here.

scoreboard players operation #pick mh.tmp = @s mh.pick

execute if score #pick mh.tmp matches 999 run return run function manhunt:tracker/api/set_auto

scoreboard players remove #pick mh.tmp 1
scoreboard players operation @s mh.target = #pick mh.tmp

# Force the compass to repaint even if the new target is at a similar position:
# otherwise the move threshold could suppress the write and the hunter would see no
# confirmation that their choice took effect.
scoreboard players set @s mh.st -99

tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.target.now","fallback":"Now tracking ","color":"white"},{"selector":"@a[scores={mh.role=1}]","color":"green"}]
