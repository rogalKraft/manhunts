# core/trigger/menu — one player used `/trigger mh.menu`. Runs as @s.
#
# Consume-then-re-arm is the whole contract. `set 0` rather than `reset`: reset
# removes the entry entirely, after which no `scores={mh.menu=...}` selector can
# match the player again and the re-arm silently never happens.

# --- handler (arrives with the player subsystem) ---
function manhunt:player/menu

scoreboard players set @s mh.menu 0
scoreboard players enable @s mh.menu
