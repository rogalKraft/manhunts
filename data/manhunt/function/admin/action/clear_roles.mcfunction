# Everyone back to unassigned. Returns spectators to survival, since the pack put them
# there (FR-10.5).
execute as @a[scores={mh.role=3}] run gamemode survival @s
execute as @a run function manhunt:roles/api/set_role {role:0}
tellraw @s [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.msg.roles_cleared","fallback":"All roles cleared.","color":"white"}]
