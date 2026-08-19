# reset/match — ready for a rematch with the same teams (TECH §10).
#
# Clears the match; keeps roles and config. Idempotent and phase-agnostic: running it
# twice, or in `idle`, is a no-op rather than an error (FR-10.9).

function manhunt:reset/soft
function manhunt:lifecycle/border/restore

function manhunt:reset/clear/players
function manhunt:reset/clear/entities
function manhunt:reset/clear/storage

tellraw @a [{"translate":"manhunt.prefix","fallback":"[Manhunt] ","color":"green"},{"translate":"manhunt.msg.reset_match","fallback":"Match reset. Roles kept — press Start for a rematch.","color":"white"}]
