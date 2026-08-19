# core/trigger/pick — one player used `/trigger mh.pick set <index>`, from a button
# in the runtime-built target menu. Runs as @s.
#
# The chosen index must be read BEFORE the score is consumed below.

# --- handler (arrives with the tracker subsystem) ---
function manhunt:tracker/api/set_target

scoreboard players set @s mh.pick 0
scoreboard players enable @s mh.pick
