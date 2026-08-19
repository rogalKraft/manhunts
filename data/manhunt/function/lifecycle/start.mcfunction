# lifecycle/start — begin a match. Gate first, act second.
#
# A failed start changes NO state (FR-1.5): precheck only reads and reports, and
# nothing below runs unless every precondition passed.

function manhunt:lifecycle/precheck
execute if score #start.ok mh.tmp matches 1 run function manhunt:lifecycle/begin
