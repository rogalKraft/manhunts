# migrate v3 -> v4 — per-hunter compass bookkeeping.
#
# mh.slot  where this hunter keeps their tracker (0-8), -1 = not placed yet
# mh.st    last written state: 0 nodata, 1 live, 2 stale
# mh.px/pz last written target, so the item is only rewritten when it actually moved
#
# These exist to stop rewriting the item every cycle. Rewriting a held item resets its
# render state, so the compass visibly flickered; and pinning it to one configured slot
# ignored that different players keep it in different places.

scoreboard objectives add mh.slot dummy
scoreboard objectives add mh.st dummy
scoreboard objectives add mh.px dummy
scoreboard objectives add mh.pz dummy

data modify storage manhunt:meta schema_version set value 4
