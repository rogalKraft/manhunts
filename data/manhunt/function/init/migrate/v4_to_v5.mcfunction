# migrate v4 -> v5 — mh.miss, the grace counter before re-issuing a tracker.
#
# Without it the pack re-gave the tracker the instant it was not in a hotbar slot,
# which includes the moment a player picks it up to drag it somewhere else. The item
# was yanked back mid-drag and felt welded to its slot.

scoreboard objectives add mh.miss dummy

data modify storage manhunt:meta schema_version set value 5
