# roles/waypoints_enforce — keep match participants off the locator bar.
#
# Re-asserted once a second rather than applied once, because **a player's attribute
# modifiers are wiped when they die and respawn**. Seen in-game: a runner killed
# mid-match came back with waypoint_transmit_range restored to 6.0E7, putting them
# straight back on every hunter's locator bar at the worst possible moment.
#
# Gated on the phase, NOT just on holding a role. `ended` is not `idle`, so the tick
# dispatcher is still running then — without this gate the enforcement re-suppressed
# the attribute a fraction of a second after reset/soft had restored it, and a player
# who survived the match stayed invisible on the bar indefinitely. Only a player who
# happened to DIE got their attribute back, because death wipes modifiers anyway.
#
# Checked before applying so the usual case costs one read: `modifier add` refuses a
# duplicate id, and re-adding blindly every second would spam the console.

execute if data storage manhunt:state {phase:"ended"} run return 0

execute if data storage manhunt:config {hide_locator_bar:true} as @a[scores={mh.role=1..2}] run function manhunt:roles/waypoint_check
