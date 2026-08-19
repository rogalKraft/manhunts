# hud/actionbar_runner — the runner's permanent line.
#
# Tells them HOW MANY hunters are after them, never where any of them is (FR-8.6).
# Proximity is a separate, sound-only mechanic (D-14); position is never given away.

execute as @a[scores={mh.role=1}] run title @s actionbar [{"translate":"manhunt.hud.hunted_by","fallback":"Hunted by ","color":"gray"},{"score":{"name":"#hunters.alive","objective":"mh.tmp"},"color":"red","bold":true}]
