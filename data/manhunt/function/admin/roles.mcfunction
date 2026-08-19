# admin/roles — who is what right now.
#
# ensure_seen first: the "Unassigned" line below is a selector component, and a score
# selector cannot match a player with no entry in the objective. Without this, someone
# who joined in the last second is missing from the listing entirely — the operator is
# told there is nobody left to assign while a player stands there with no role.
function manhunt:roles/ensure_seen

tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.list.runners","fallback":"Runners: ","color":"green"},{"selector":"@a[scores={mh.role=1}]","color":"white"}]
tellraw @s [{"text":"          "},{"translate":"manhunt.list.hunters","fallback":"Hunters: ","color":"red"},{"selector":"@a[scores={mh.role=2}]","color":"white"}]
tellraw @s [{"text":"          "},{"translate":"manhunt.list.spectators","fallback":"Spectators: ","color":"gray"},{"selector":"@a[scores={mh.role=3}]","color":"white"}]
tellraw @s [{"text":"          "},{"translate":"manhunt.list.unassigned","fallback":"Unassigned: ","color":"dark_gray"},{"selector":"@a[scores={mh.role=0}]","color":"white"}]
