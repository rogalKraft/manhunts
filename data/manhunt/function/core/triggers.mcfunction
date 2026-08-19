# core/triggers — the only level-0 bridge from a player into pack logic.
#
# /dialog is permission-gated at `gamemasters`, so a non-op cannot type it. Functions
# run at level 2 and may show a dialog TO a non-op, but the player has to reach the
# function somehow, and /trigger is the only way (TECH.md §9).
#
# Runs every tick even in `idle`, because a player must be able to check status and
# pick a compass target whenever. The cost is a score-filtered @a scan that matches
# nothing in the common case.
#
# CRITICAL — `scoreboard players enable` grants EXACTLY ONE use. Verified in-game
# 2026-08-11: the first dialog button fired, the second was refused. Each use is
# therefore consumed and re-armed by its own handler, as @s, which is O(1) per
# interaction rather than per player per tick. Initial arming: init/restore and
# roles/on_join.
#
# The failure mode if this is ever broken is invisible from the player's side — a
# button that does nothing, with no error and no log entry (R-28).

execute as @a[scores={mh.menu=1..}] run function manhunt:core/trigger/menu
execute as @a[scores={mh.pick=1..}] run function manhunt:core/trigger/pick
