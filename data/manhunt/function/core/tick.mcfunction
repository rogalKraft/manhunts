# core/tick — THE #minecraft:tick entry point.
#
# Everything here costs 20x/second, forever, on every world that merely has the pack
# installed. Keep it to these four lines.
#
# The cycle counter lives HERE rather than in core/active because some work has to
# happen in `idle` too: a player who has never been seen needs a role value before an
# admin can assign anything to them. That was previously done only outside `idle`, so
# after a full reset nobody had a role score at all, bulk assignment matched nobody,
# and Start refused with "no runners assigned" and no way to fix it from the panel.
# Found in play 2026-08-12.
#
# Idle cost: a counter increment, one storage comparison, one scan per second, and a
# score-filtered scan that matches nothing in the common case.

function manhunt:core/cycle

execute if score #cycle mh.cycle matches 0 run function manhunt:roles/ensure_seen
execute unless data storage manhunt:state {phase:"idle"} run function manhunt:core/active
function manhunt:core/triggers
