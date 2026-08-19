# win/api/declare — THE ONLY writer of manhunt:state outcome.
#
# Macro. Required keys: `winner` ("runners" | "hunters" | "none"), `reason`.
# Call sites: docs/TECH.md §12.
#
# Idempotent by guard: a second call in the same tick finds phase already "ended" and
# does nothing, so two win conditions firing together cannot overwrite each other.
# The tie-break itself is the ORDER inside win/check, not a race here (D-5).

execute if data storage manhunt:state {phase:"ended"} run return 0

$data modify storage manhunt:state outcome.winner set value "$(winner)"
$data modify storage manhunt:state outcome.reason set value "$(reason)"

execute store result score #now mh.tmp run time query gametime
execute store result score #started mh.tmp run data get storage manhunt:state match_started
scoreboard players operation #now mh.tmp -= #started mh.tmp
execute store result storage manhunt:state outcome.duration long 1 run scoreboard players get #now mh.tmp

function manhunt:lifecycle/to_ended
