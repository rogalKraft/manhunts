# lifecycle/precheck — the four start preconditions (PRD §7.5).
#
# Sets #start.ok to 1, then lets each failing check clear it. Every failure reports
# WHICH precondition failed (FR-1.5) — "cannot start" with no reason is the kind of
# thing a host cannot act on.
#
# Runs as the requesting player, so @s in the failure messages is whoever pressed the
# button. `execute unless ... run function` does not change the executor.

scoreboard players set #start.ok mh.tmp 1

# Phase must be idle or ended. Anything else means a match is already in progress.
execute unless data storage manhunt:state {phase:"idle"} unless data storage manhunt:state {phase:"ended"} run function manhunt:lifecycle/fail/busy

# At least one of each side.
execute unless entity @a[scores={mh.role=1}] run function manhunt:lifecycle/fail/no_runners
execute unless entity @a[scores={mh.role=2}] run function manhunt:lifecycle/fail/no_hunters

# E-4: a world where the dragon is already dead has no objective left to race for.
# Detected via the vanilla advancement rather than a scoreboard, because the score
# only exists for players who were present for the kill.
execute unless data storage manhunt:config {allow_dragon_pre_slain:true} if entity @a[advancements={minecraft:end/kill_dragon=true}] run function manhunt:lifecycle/fail/dragon_slain
